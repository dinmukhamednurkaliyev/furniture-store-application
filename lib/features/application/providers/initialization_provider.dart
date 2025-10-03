import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initialization_provider.g.dart';

enum InitialRoute {
  onboarding,
  signIn,
  home,
}

Future<InitialRoute> _getInitialRoute(Ref ref) async {
  final getOnboardingStatus = await ref.watch(
    getOnboardingStatusUsecaseProvider.future,
  );
  final getSignInStatus = await ref.watch(
    getSignInStatusUsecaseProvider.future,
  );

  final onboardingResult = await getOnboardingStatus();
  final signInResult = await getSignInStatus();

  final hasSeenOnboarding = onboardingResult.when(
    success: (status) => status,
    error: (_) => false,
  );

  final isSignedIn = signInResult.when(
    success: (status) => status,
    error: (_) => false,
  );

  if (!hasSeenOnboarding) {
    return InitialRoute.onboarding;
  }
  if (!isSignedIn) {
    return InitialRoute.signIn;
  }
  return InitialRoute.home;
}

@riverpod
Future<InitialRoute> initialization(Ref ref) async {
  const minimumSplashDuration = Duration(milliseconds: 1500);

  final results = await Future.wait([
    _getInitialRoute(ref),

    Future.delayed(minimumSplashDuration),
  ]);

  return results.first as InitialRoute;
}
