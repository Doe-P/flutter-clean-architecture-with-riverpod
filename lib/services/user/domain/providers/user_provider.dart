import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/services/user/data/datasource/user_local_datasource.dart';
import 'package:product_store_app/services/user/data/repositories/user_repository_impl.dart';
import 'package:product_store_app/services/user/domain/repositories/user_repository.dart';
import 'package:product_store_app/shared/data/local/storage_service.dart';
import 'package:product_store_app/shared/domain/providers/sharedpreferences_storage_service_provider.dart';

final userCacheDataSourceProvider = Provider.family<UserDataSource, StorageService>((_, storageService) => UserLocalDataSource(storageService: storageService));

final userCacheRepositoryProvider = Provider<UserRepository>((ref){
  final StorageService storageService = ref.watch(storageServiceProvider);
  final UserDataSource dataSource = ref.watch(userCacheDataSourceProvider(storageService));
  return UserRepositoryImpl(dataSource: dataSource);
});