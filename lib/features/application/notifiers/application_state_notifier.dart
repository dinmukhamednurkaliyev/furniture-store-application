import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';
import 'package:furniture_store_application/features/setting/setting.dart';

final applicationStateNotifierProvider =
    NotifierProvider<ApplicationStateNotifier, ApplicationState>(
      ApplicationStateNotifier.new,
    );

class ApplicationStateNotifier extends Notifier<ApplicationState> {
  @override
  ApplicationState build() {
    initializeApplication();

    return ApplicationInitial();
  }

  Future<void> initializeApplication() async {
    try {
      state = ApplicationLoading();

      final getHasSeenOnboarding = ref.read(getHasSeenOnboardingProvider);
      final getAuthStatus = ref.read(getAuthorizationStatusProvider);

      final results = await Future.wait([
        getHasSeenOnboarding(),
        getAuthStatus(),
      ]);

      final onboardingResult = results[0] as Result<bool>;
      final authResult = results[1] as Result<UserEntity?>;

      final hasSeenOnboarding = switch (onboardingResult) {
        Success(data: final seen) => seen,
        Error() => false,
      };

      final currentUser = switch (authResult) {
        Success(data: final user) => user,
        Error() => null,
      };

      state = ApplicationReady(
        hasSeenOnboarding: hasSeenOnboarding,
        currentUser: currentUser,
      );
    } on Exception catch (e) {
      state = ApplicationError(e.toString());
    }
  }

  Future<void> markOnboardingSeen() async {
    final currentState = state;
    if (currentState is! ApplicationReady) return;

    final setOnboardingSeen = ref.read(setOnboardingSeenProvider);
    await setOnboardingSeen();

    state = currentState.copyWith(hasSeenOnboarding: true);
  }

  void onSignInSuccess(UserEntity user) {
    final currentState = state;
    if (currentState is! ApplicationReady) return;

    state = currentState.copyWith(currentUser: user);
  }

  void onSignOut() {
    final currentState = state;
    if (currentState is! ApplicationReady) return;

    state = currentState.copyWith(clearCurrentUser: true);
  }
}
