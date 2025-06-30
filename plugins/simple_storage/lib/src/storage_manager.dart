import 'package:simple_storage/src/storage_interface.dart';

class StorageManager {
  final StorageInterface _storage;
  static StorageManager? _instance;

  StorageManager._({required StorageInterface storage}) : _storage = storage;

  static Future<StorageManager> getInstance({
    required StorageInterface storage,
  }) async {
    _instance ??= StorageManager._(storage: storage);
    await _instance!._storage.init();
    return _instance!;
  }

  Future<void> setValue<T>(String key, T value) =>
      _storage.setValue(key, value);

  Future<T?> getValue<T>(String key) => _storage.getValue<T>(key);

  Future<void> removeValue(String key) => _storage.removeValue(key);

  Future<void> clear() => _storage.clear();
}
