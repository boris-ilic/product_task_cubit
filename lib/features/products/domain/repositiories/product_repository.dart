import 'package:product_app/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts({int limit = 10, int offset = 0});
}
