import 'package:product_app/features/products/domain/entities/product.dart';
import 'package:product_app/features/products/domain/repositiories/product_repository.dart';

import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getAllProducts({int limit = 10, int offset = 0}) {
    return remoteDataSource.fetchProducts(limit: limit, offset: offset);
  }
}
