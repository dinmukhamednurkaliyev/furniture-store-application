import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_notifier.g.dart';

@riverpod
class AuthenticationNotifier extends _$AuthenticationNotifier {
  @override
  Future<UserEntity?> build() async {
    final getSignInStatus = await ref.watch(
      getSignInStatusUsecaseProvider.future,
    );
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
    final signInUsecase = await ref.read(signInUsecaseProvider.future);
    state = await AsyncValue.guard(() async {
      final result = await signInUsecase(email: email, password: password);
      return result.when(
        success: (user) => user,
        error: (failure) => throw Exception(failure.toString()),
      );
    });
  }

  Future<void> signUp(String name, String email, String password) async {
    state = const AsyncValue.loading();
    final signUpUsecase = await ref.read(signUpUsecaseProvider.future);
    state = await AsyncValue.guard(() async {
      final result = await signUpUsecase(
        name: name,
        email: email,
        password: password,
      );
      return result.when(
        success: (user) => user,
        error: (failure) => throw Exception(failure.toString()),
      );
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    final signOutUsecase = await ref.read(signOutUsecaseProvider.future);
    state = await AsyncValue.guard(() async {
      final result = await signOutUsecase();
      result.when(
        success: (_) {},
        error: (failure) => throw Exception(failure.toString()),
      );
      return null;
    });
  }

  Future<void> updateUser(UserEntity updatedData) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentUser = state.asData?.value;
      if (currentUser == null) {
        throw Exception('User not authenticated or is currently loading');
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
