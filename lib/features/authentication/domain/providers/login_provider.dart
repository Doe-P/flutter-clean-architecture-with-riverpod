import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:product_store_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:product_store_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:product_store_app/shared/data/remote/remote.dart';
import 'package:product_store_app/shared/domain/providers/dio_network_service_provider.dart';

final authDataSourceProvider = Provider.family<LoginUserDataSource, NetworkService>((_, networkService) => LoginUserRemoteDataSource(networkService: networkService));

final authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final LoginUserDataSource dataSource = ref.watch(authDataSourceProvider(networkService));
  return AuthenticationRepositoryImpl(dataSource: dataSource);
});