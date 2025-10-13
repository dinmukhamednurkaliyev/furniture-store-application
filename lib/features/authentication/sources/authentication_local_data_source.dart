import 'dart:convert';

import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthenticationLocalDataSource {
  Future<bool> getSignInStatus();
  Future<void> setSignInStatus({required bool status});
  Future<UserEntity> getUser();
  Future<UserEntity> setUser({required UserEntity user});
  Future<void> resetPassword({required String email});
}

class AuthenticationLocalDataSourceImplementation
    implements AuthenticationLocalDataSource {
  const AuthenticationLocalDataSourceImplementation(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _isSignInKey = 'is_sign_in';
  static const String _userKey = 'user_entity';

  @override
  Future<bool> getSignInStatus() async {
    try {
      return _sharedPreferences.getBool(_isSignInKey) ?? false;
    } catch (e) {
      throw ApplicationException.cacheException(
        message: 'Error getting sign-in status: $e',
      );
    }
  }

  @override
  Future<void> setSignInStatus({required bool status}) async {
    try {
      await _sharedPreferences.setBool(_isSignInKey, status);
    } catch (e) {
      throw ApplicationException.cacheException(
        message: 'Error setting sign-in status: $e',
      );
    }
  }

  @override
  Future<UserEntity> getUser() async {
    try {
      final jsonString = _sharedPreferences.getString(_userKey);
      if (jsonString != null) {
        return UserEntity.fromJson(
          json.decode(jsonString) as Map<String, dynamic>,
        );
      }
      return const UserEntity(email: null, name: null);
    } catch (e) {
      throw ApplicationException.cacheException(
        message: 'Error getting user: $e',
      );
    }
  }

  @override
  Future<UserEntity> setUser({required UserEntity user}) async {
    try {
      final jsonString = json.encode(user.toJson());
      await _sharedPreferences.setString(_userKey, jsonString);
      return user;
    } catch (e) {
      throw ApplicationException.cacheException(
        message: 'Error setting user: $e',
      );
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      final user = await getUser();
      if (user.email != email) {
        return;
      }
    } catch (e) {
      throw ApplicationException.cacheException(
        message: 'Error resetting password: $e',
      );
    }
  }
}
