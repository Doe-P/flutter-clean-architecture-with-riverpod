import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/shared/data/local/shared_prefs_storage_service.dart';
import 'package:product_store_app/shared/data/local/storage_service.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  final SharedPrefsService sharedPrefsService = SharedPrefsService();
  sharedPrefsService.initialize();
  return sharedPrefsService;
});