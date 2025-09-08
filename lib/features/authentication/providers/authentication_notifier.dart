import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class AuthenticationNotifier extends Notifier<AsyncValue<UserEntity?>> {
  @override
  AsyncValue<UserEntity?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> initialize() async {
    state = const AsyncValue.loading();
    try {
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
                state = AsyncValue.data(user);
              },
              error: (failure) {
                state = AsyncValue.error(failure, StackTrace.current);
              },
            );
          } else {
            state = const AsyncValue.data(null);
          }
        },
        error: (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
        },
      );
    } on Exception catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final getUser = await ref.read(getUserUsecaseProvider.future);
      final setSignInStatus = await ref.read(
        setSignInStatusUsecaseProvider.future,
      );

      final userResult = await getUser();

      await userResult.when(
        success: (fetchedUser) async {
          if (fetchedUser.email != email) {
            state = AsyncValue.error(
              'Incorrect email or password.',
              StackTrace.current,
            );
            return;
          }

          final signInResult = await setSignInStatus(status: true);
          signInResult.when(
            success: (_) {
              state = AsyncValue.data(fetchedUser);
            },
            error: (failure) {
              state = AsyncValue.error(failure, StackTrace.current);
            },
          );
        },
        error: (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
        },
      );
    } on Exception catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    state = const AsyncValue.loading();
    try {
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
              state = AsyncValue.data(savedUser);
            },
            error: (failure) {
              state = AsyncValue.error(failure, StackTrace.current);
            },
          );
        },
        error: (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
        },
      );
    } on Exception catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      final setSignInStatus = await ref.read(
        setSignInStatusUsecaseProvider.future,
      );
      final result = await setSignInStatus(status: false);
      result.when(  
        success: (_) {
          state = const AsyncValue.data(null);
        },
        error: (failure) {
          state = AsyncValue.error(failure, StackTrace.current);
        },
      );
    } on Exception catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
