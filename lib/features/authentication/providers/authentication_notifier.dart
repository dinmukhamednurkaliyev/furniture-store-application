import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class AuthenticationNotifier extends Notifier<AuthenticationState> {
  @override
  AuthenticationState build() {
    return const AuthenticationState();
  }

  Future<void> initialize() async {
    state = state.copyWith(isLoading: true);
    // Теперь мы дожидаемся получения use case'ов
    final getSignInStatus = await ref.read(
      getSignInStatusUsecaseProvider.future,
    );
    final getUser = await ref.read(getUserUsecaseProvider.future);

    final signInResult = await getSignInStatus();
    await signInResult.when(
      success: (isSignIn) async {
        if (isSignIn) {
          final userResult = await getUser();
          userResult.when(
            success: (user) {
              state = state.copyWith(
                isLoading: false,
                isSignIn: true,
                user: user,
              );
            },
            error: (failure) {
              state = state.copyWith(
                isLoading: false,
                errorMessage: failure.message,
              );
            },
          );
        } else {
          state = state.copyWith(isLoading: false, isSignIn: false);
        }
      },
      error: (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
    );
  }

  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true);
    final setUser = await ref.read(setUserUsecaseProvider.future);
    final setSignInStatus = await ref.read(
      setSignInStatusUsecaseProvider.future,
    );

    final user = UserEntity(email: email, name: 'Test User');
    final userResult = await setUser(user: user);
    await userResult.when(
      success: (_) async {
        final signInResult = await setSignInStatus(status: true);
        signInResult.when(
          success: (_) {
            state = state.copyWith(
              isLoading: false,
              isSignIn: true,
              user: user,
            );
          },
          error: (failure) {
            state = state.copyWith(
              isLoading: false,
              errorMessage: failure.message,
            );
          },
        );
      },
      error: (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
    );
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);
    final setSignInStatus = await ref.read(
      setSignInStatusUsecaseProvider.future,
    );
    final result = await setSignInStatus(status: false);
    result.when(
      success: (_) {
        state = const AuthenticationState();
      },
      error: (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
      },
    );
  }
}
