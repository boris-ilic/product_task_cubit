import 'package:flutter/material.dart';
import 'package:product_app/features/products/domain/entities/product.dart';
import 'package:product_app/features/products/presentation/pages/product_detail_page.dart';
import 'package:product_app/features/products/presentation/pages/product_list_page.dart';

class AppRoutes {
  static const String productList = '/';
  static const String productDetail = '/product_detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productList:
        return MaterialPageRoute(builder: (_) => const ProductListPage());
      case productDetail:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailPage(product: product),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
