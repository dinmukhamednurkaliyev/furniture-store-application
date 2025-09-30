// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingAction)
const onboardingActionProvider = OnboardingActionProvider._();

final class OnboardingActionProvider
    extends $AsyncNotifierProvider<OnboardingAction, void> {
  const OnboardingActionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingActionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingActionHash();

  @$internal
  @override
  OnboardingAction create() => OnboardingAction();
}

String _$onboardingActionHash() => r'005956fdde3946b94470989cc1188fc89a6b21b1';

abstract class _$OnboardingAction extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
