import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_app/features/products/domain/entities/product.dart';
import 'package:product_app/features/products/domain/usecases/get_all_products.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProducts getAllProducts;
  List<Product> _products = [];
  int _offset = 0;
  final int _limit = 10;
  bool isLoadingMore = false;
  bool hasMore = true;

  ProductCubit({required this.getAllProducts}) : super(ProductInitial());

  Future<void> fetchProducts({bool loadMore = false}) async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;

    try {
      if (!loadMore) emit(ProductLoading());
      final products = await getAllProducts(limit: _limit, offset: _offset);

      if (products.length < _limit) {
        hasMore = false;
      }

      if (loadMore) {
        _products.addAll(products);
      } else {
        _products = products;
      }

      _offset += _limit;
      emit(ProductLoaded(List.from(_products)));
    } catch (_) {
      emit(ProductError('Failed to fetch products'));
    }

    isLoadingMore = false;
  }
}
