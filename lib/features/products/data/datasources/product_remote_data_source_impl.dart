import 'package:dio/dio.dart';
import 'package:product_app/core/constants.dart';
import 'package:product_app/features/products/data/models/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio _dio = Dio();

  @override
  Future<List<ProductModel>> fetchProducts({int limit = 10, int offset = 0}) async {
    final response = await _dio.get('${ApiConstants.baseUrl}/products');

    if (response.statusCode == 200) {
      final data = response.data as List;
      final all = data.map((json) => ProductModel.fromJson(json)).toList();

      final start = offset;
      final end = (offset + limit) > all.length ? all.length : (offset + limit);

      return start >= all.length ? [] : all.sublist(start, end);
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
