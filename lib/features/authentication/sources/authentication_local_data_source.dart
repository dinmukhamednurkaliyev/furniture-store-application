import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthenticationLocalDataSource {
  Future<bool> getSignInStatus();
  Future<void> setSignInStatus({required bool status});
  Future<UserEntity> getUser();
  Future<UserEntity> setUser({required UserEntity user});
}

class AuthenticationLocalDataSourceImplementation
    implements AuthenticationLocalDataSource {
  const AuthenticationLocalDataSourceImplementation(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _isSignInKey = 'is_sign_in';
  static const String _userEmailKey = 'user_email';
  static const String _userNameKey = 'user_name';

  @override
  Future<bool> getSignInStatus() async {
    try {
      return _sharedPreferences.getBool(_isSignInKey) ?? false;
    } catch (e) {
      throw CacheException(message: 'Error getting sign-in status: $e');
    }
  }

  @override
  Future<void> setSignInStatus({required bool status}) async {
    try {
      await _sharedPreferences.setBool(_isSignInKey, status);
    } catch (e) {
      throw CacheException(message: 'Error setting sign-in status: $e');
    }
  }

  @override
  Future<UserEntity> getUser() async {
    try {
      final email = _sharedPreferences.getString(_userEmailKey);
      final name = _sharedPreferences.getString(_userNameKey);
      return UserEntity(email: email, name: name);
    } catch (e) {
      throw CacheException(message: 'Error getting user: $e');
    }
  }

  @override
  Future<UserEntity> setUser({required UserEntity user}) async {
    try {
      final savedName = user.name?.split('@')[0];
      if (user.email != null) {
        await _sharedPreferences.setString(_userEmailKey, user.email!);
      }
      if (savedName != null) {
        await _sharedPreferences.setString(_userNameKey, savedName);
      }
      return UserEntity(email: user.email, name: savedName);
    } catch (e) {
      throw CacheException(message: 'Error setting user: $e');
    }
  }
}
