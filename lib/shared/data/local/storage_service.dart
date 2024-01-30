abstract class StorageService {
  void initialize();

  bool get hasInitialized;

  Future<Object?> get(String key);

  Future<bool> set(String key, String data);

  Future<bool> remove(String key);

  Future<void> clear();

  Future<bool> has(String key);
}
