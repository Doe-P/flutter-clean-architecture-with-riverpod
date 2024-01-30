import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/services/credential/data/datasource/credential_local_datasource.dart';
import 'package:product_store_app/services/credential/data/repositories/credential_repository_impl.dart';
import 'package:product_store_app/services/credential/domain/repositories/credential_repository.dart';
import 'package:product_store_app/shared/data/local/storage_service.dart';
import 'package:product_store_app/shared/domain/providers/sharedpreferences_storage_service_provider.dart';

final credentialDataSourceProvider = Provider.family<CredentialDataSource, StorageService>((_, storageService) => CredentialLocalDataSource(storageService: storageService));

final credentialRepositoryProvider = Provider<CredentialRepository>((ref){
  final StorageService storageService = ref.watch(storageServiceProvider);
  final CredentialDataSource dataSource = ref.watch(credentialDataSourceProvider(storageService));
  return CredentialRepositoryImpl(dataSource: dataSource);
});