import 'package:get_it/get_it.dart';
import 'package:product_app/features/products/data/datasources/product_remote_data_source_impl.dart';
import 'package:product_app/features/products/domain/repositiories/product_repository.dart';
import 'features/products/data/datasources/product_remote_data_source.dart';
import 'features/products/data/repositories/product_repository_impl.dart';
import 'features/products/domain/usecases/get_all_products.dart';
import 'features/products/presentation/cubit/product_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Cubit
  di.registerFactory(() => ProductCubit(getAllProducts: di()));

  // Usecases
  di.registerLazySingleton(() => GetAllProducts(di()));

  // Repository
  di.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: di()),
  );

  // Data sources
  di.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );
}
