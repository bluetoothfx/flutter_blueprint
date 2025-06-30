import 'package:simple_storage/src/secure_storage_pref/secure_storage_pref.dart';
import 'package:simple_storage/src/storage_manager.dart';

class StorageFactory {
  static Future<StorageManager> createSecureStorage() {
    return StorageManager.getInstance(
      storage: SecureStorage(),
    );
  }
}