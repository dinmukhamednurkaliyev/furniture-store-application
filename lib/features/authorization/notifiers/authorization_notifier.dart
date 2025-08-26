import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

final authorizationNotifierProvider =
    NotifierProvider<AuthorizationNotifier, AuthorizationState>(
      AuthorizationNotifier.new,
    );

class AuthorizationNotifier extends Notifier<AuthorizationState> {
  @override
  AuthorizationState build() {
    return AuthorizationInitial();
  }

  Future<void> login(String email, String password) async {
    state = AuthorizationLoading();

    await Future.delayed(const Duration(seconds: 1));
    final mockUser = UserEntity(email: email, name: 'Mock User');
    final result = Success(mockUser);

    switch (result) {
      case Success(data: final user):
        state = Authenticated(user);
        ref
            .read(applicationStateNotifierProvider.notifier)
            .onLoginSuccess(user);

      // case Error(failure: final failure):
      //   state = AuthorizationError(failure.message);
    }
  }

  Future<void> logout() async {
    state = Unauthenticated();

    ref.read(applicationStateNotifierProvider.notifier).onLogout();
  }
}
