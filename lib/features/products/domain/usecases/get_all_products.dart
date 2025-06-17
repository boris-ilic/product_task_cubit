import 'package:product_app/features/products/domain/entities/product.dart';
import 'package:product_app/features/products/domain/repositiories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<List<Product>> call({int limit = 10, int offset = 0}) {
    return repository.getAllProducts(limit: limit, offset: offset);
  }
}
