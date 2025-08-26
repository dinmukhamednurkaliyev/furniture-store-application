import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _isLoggedInKey = 'is_logged_in';
const String _userEmailKey = 'user_email';
const String _userNameKey = 'user_name';

abstract class AuthorizationLocalDataSource {
  Future<UserEntity?> getSession();

  Future<void> saveSession(UserEntity userToCache);

  Future<void> clearSession();
}

class AuthorizationLocalDataSourceImplementation
    implements AuthorizationLocalDataSource {
  AuthorizationLocalDataSourceImplementation({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<UserEntity?> getSession() async {
    try {
      final isLoggedIn = sharedPreferences.getBool(_isLoggedInKey) ?? false;

      if (!isLoggedIn) {
        return null;
      }

      final email = sharedPreferences.getString(_userEmailKey);
      final name = sharedPreferences.getString(_userNameKey);

      if (email != null && name != null) {
        return UserEntity(email: email, name: name);
      } else {
        throw CacheException();
      }
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> saveSession(UserEntity userToCache) async {
    try {
      final results = await Future.wait([
        sharedPreferences.setString(_userEmailKey, userToCache.email),
        sharedPreferences.setString(_userNameKey, userToCache.name),
        sharedPreferences.setBool(_isLoggedInKey, true),
      ]);

      if (results.any((success) => !success)) {
        throw CacheException();
      }
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      final results = await Future.wait([
        sharedPreferences.remove(_userEmailKey),
        sharedPreferences.remove(_userNameKey),
        sharedPreferences.remove(_isLoggedInKey),
      ]);

      if (results.any((success) => !success)) {
        throw CacheException();
      }
    } on Exception {
      throw CacheException();
    }
  }
}
