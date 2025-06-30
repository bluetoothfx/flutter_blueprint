abstract class StorageInterface {
  Future<void> init();
  Future<T?> getValue<T>(String key);
  Future<void> setValue<T>(String key, T value);
  Future<void> removeValue(String key);
  Future<void> clear();
}