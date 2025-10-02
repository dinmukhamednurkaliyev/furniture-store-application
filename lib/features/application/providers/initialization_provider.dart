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
  // 2. Define the minimum duration. This should match your splash animation time.
  const minimumSplashDuration = Duration(milliseconds: 1500);

  // 3. Use Future.wait to run the logic and the timer in parallel.
  final results = await Future.wait([
    // First future: our actual logic.
    _getInitialRoute(ref),
    // Second future: a delay to ensure the splash is visible.
    Future.delayed(minimumSplashDuration),
  ]);

  // 4. The Future.wait returns a list of the results. We only care about the
  //    result from our logic, which is the first item in the list.
  return results.first as InitialRoute;
}
