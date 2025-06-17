import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/routes.dart';
import 'package:product_app/features/products/presentation/cubit/product_cubit.dart';
import 'package:product_app/features/products/presentation/widgets/product_list_item.dart';
import 'package:product_app/core/injection_container.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final _scrollController = ScrollController();
  late final ProductCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = di<ProductCubit>();
    _cubit.fetchProducts();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_cubit.state is ProductLoaded &&
        _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100 &&
        _cubit.hasMore &&
        !_cubit.isLoadingMore) {
      _cubit.fetchProducts(loadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading && (state is! ProductLoaded)) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return ListView.separated(
                controller: _scrollController,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  if (index < state.products.length) {
                    final product = state.products[index];
                    return ProductListItem(
                      title: product.title,
                      price: product.price,
                      imageUrl: product.image,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.productDetail,
                          arguments: product,
                        );
                      },
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
