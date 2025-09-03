import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class AuthenticationNotifier extends Notifier<AuthenticationState> {
  @override
  AuthenticationState build() {
    return const AuthenticationState();
  }

  Future<void> initialize() async {
    state = state.copyWith(isLoading: true);
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
    final getUser = await ref.read(getUserUsecaseProvider.future);
    final setSignInStatus = await ref.read(
      setSignInStatusUsecaseProvider.future,
    );

    final userResult = await getUser();

    await userResult.when(
      success: (fetchedUser) async {
        if (fetchedUser.email != email) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: 'Incorrect email or password.',
          );
          return;
        }

        final signInResult = await setSignInStatus(status: true);
        signInResult.when(
          success: (_) {
            state = state.copyWith(
              isLoading: false,
              isSignIn: true,
              user: fetchedUser,
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

  Future<void> signUp(String name, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final setUser = await ref.read(setUserUsecaseProvider.future);
    final setSignInStatus = await ref.read(
      setSignInStatusUsecaseProvider.future,
    );

    final userToSave = UserEntity(email: email, name: name);
    final userResult = await setUser(user: userToSave);

    await userResult.when(
      success: (savedUser) async {
        final signInResult = await setSignInStatus(status: true);
        signInResult.when(
          success: (_) {
            state = state.copyWith(
              isLoading: false,
              isSignIn: true,
              user: savedUser,
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
