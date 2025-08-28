import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod/riverpod.dart';

class AuthenticationNotifier extends Notifier<AuthenticationState> {
  @override
  AuthenticationState build() {
    return const AuthenticationState();
  }

  Future<void> initialize() async {
    final getSignInStatus = ref.read(getSignInStatusUsecaseProvider);
    final getUser = ref.read(getUserUsecaseProvder);

    final signInResult = await getSignInStatus();
    await signInResult.when(
      success: (isSignIn) async {
        final userResult = await getUser();
        userResult.when(
          success: (user) {
            state = state.copyWith(isSignIn: true, user: user);
          },
          error: (failure) {
            state = state.copyWith(errorMessage: failure.message);
          },
        );
      },
      error: (failure) {
        state = state.copyWith(errorMessage: failure.message);
      },
    );
  }

  Future<void> signIn(String email, String password) async {
    final setUser = ref.read(setUserUsecaseProvider);
    final setSignInStatus = ref.read(setSignInStatusUsecaseProvider);

    state = state.copyWith(isLoading: true);

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
    final setSignInStatus = ref.read(setSignInStatusUsecaseProvider);
    state = state.copyWith(isLoading: true);
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
