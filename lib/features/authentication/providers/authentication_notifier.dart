import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class AuthenticationNotifier extends AsyncNotifier<UserEntity?> {
  @override
  Future<UserEntity?> build() async {
    final getSignInStatus =
        await ref.read(getSignInStatusUsecaseProvider.future);
    final getUser = await ref.read(getUserUsecaseProvider.future);

    final signInResult = await getSignInStatus();

    return signInResult.when(
      success: (isSignIn) async {
        if (isSignIn) {
          final userResult = await getUser();
          return userResult.when(
            success: (user) => user,
            error: (failure) => throw Exception(failure.toString()),
          );
        }
        return null;
      },
      error: (failure) => throw Exception(failure.toString()),
    );
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final getUser = await ref.read(getUserUsecaseProvider.future);
      final setSignInStatus =
          await ref.read(setSignInStatusUsecaseProvider.future);

      final userResult = await getUser();
      final fetchedUser = userResult.when(
        success: (user) => user,
        error: (failure) => throw Exception(failure.toString()),
      );

      if (fetchedUser.email != email) {
        throw Exception('Incorrect email or password.');
      }

      final signInResult = await setSignInStatus(status: true);
      signInResult.when(
        success: (_) {},
        error: (failure) => throw Exception(failure.toString()),
      );

      return fetchedUser;
    });
  }

  Future<void> signUp(String name, String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final setUser = await ref.read(setUserUsecaseProvider.future);
      final setSignInStatus =
          await ref.read(setSignInStatusUsecaseProvider.future);

      final userToSave = UserEntity(email: email, name: name);
      final userResult = await setUser(user: userToSave);

      final savedUser = userResult.when(
        success: (user) => user,
        error: (failure) => throw Exception(failure.toString()),
      );

      final signInResult = await setSignInStatus(status: true);
      signInResult.when(
        success: (_) {},
        error: (failure) => throw Exception(failure.toString()),
      );

      return savedUser;
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final setSignInStatus =
          await ref.read(setSignInStatusUsecaseProvider.future);
      final result = await setSignInStatus(status: false);
      result.when(
        success: (_) {},
        error: (failure) => throw Exception(failure.toString()),
      );
      return null;
    });
  }

  Future<void> resetPassword(String email) async {
    final resetPasswordUsecase =
        await ref.read(resetPasswordUsecaseProvider.future);
    final result = await resetPasswordUsecase(email: email);
    result.when(success: (_) {}, error: (f) => throw Exception(f.toString()));
  }

  Future<void> updateUser(UserEntity updatedData) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentUser = state.valueOrNull;
      if (currentUser == null) {
        throw Exception('User not authenticated');
      }

      final setUser = await ref.read(setUserUsecaseProvider.future);
      final userToSave = currentUser.copyWith(
        name: updatedData.name,
        email: updatedData.email,
        phone: updatedData.phone,
        profileImage: updatedData.profileImage,
      );

      final result = await setUser(user: userToSave);
      return result.when(
        success: (user) => user,
        error: (failure) => throw Exception(failure.toString()),
      );
    });
  }
}
