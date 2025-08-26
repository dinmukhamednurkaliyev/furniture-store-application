import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

class AuthorizationProvider with ChangeNotifier {
  AuthorizationProvider({
    required GetAuthorizationStatus getAuthorizationStatus,
  }) : _getAuthorizationStatus = getAuthorizationStatus;
  final GetAuthorizationStatus _getAuthorizationStatus;

  AuthorizationState _state = AuthorizationInitial();
  AuthorizationState get state => _state;

  // Бывший `initialize`
  Future<void> checkAuthorizationStatus() async {
    _state = AuthorizationLoading();
    notifyListeners();

    final result = await _getAuthorizationStatus();

    switch (result) {
      case Success(data: final user):
        _state = user != null ? Authenticated(user) : Unauthenticated();
      case Error(failure: final failure):
        _state = AuthorizationError(failure.message);
    }
    notifyListeners();
  }

  // ... другие методы, например logout ...
  Future<void> logout() async {
    // ... вызов LogoutUseCase ...
    _state = Unauthenticated();
    notifyListeners();
  }
}
