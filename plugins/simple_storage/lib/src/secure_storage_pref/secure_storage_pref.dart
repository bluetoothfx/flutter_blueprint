import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_storage/src/shared_preferences_exception.dart';
import 'dart:convert';
import 'package:simple_storage/src/storage_interface.dart';

class SecureStorage implements StorageInterface {
  late FlutterSecureStorage _storage;

  SecureStorage({AndroidOptions? androidOptions, IOSOptions? iosOptions}) {
    _storage = FlutterSecureStorage(
      aOptions: androidOptions ?? const AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: iosOptions ?? const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }

  @override
  Future<void> init() async {
    // No initialization needed for FlutterSecureStorage
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    try {
      final encodedValue = json.encode({
        'type': T.toString(),
        'value': value,
      });
      await _storage.write(key: key, value: encodedValue);
    } catch (e) {
      throw StorageException('Failed to save secure value', e);
    }
  }

  @override
  Future<T?> getValue<T>(String key) async {
    try {
      final encodedValue = await _storage.read(key: key);
      if (encodedValue == null) return null;

      final decodedValue = json.decode(encodedValue);
      if (decodedValue['type'] != T.toString()) {
        throw StorageException('Type mismatch: Expected $T but found ${decodedValue['type']}');
      }
      return decodedValue['value'] as T;
    } catch (e) {
      throw StorageException('Failed to get secure value', e);
    }
  }

  @override
  Future<void> removeValue(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw StorageException('Failed to remove secure value', e);
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw StorageException('Failed to clear secure storage', e);
    }
  }
}
