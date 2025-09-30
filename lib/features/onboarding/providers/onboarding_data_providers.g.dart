// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingLocalDataSource)
const onboardingLocalDataSourceProvider = OnboardingLocalDataSourceProvider._();

final class OnboardingLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<OnboardingLocalDataSource>,
          OnboardingLocalDataSource,
          FutureOr<OnboardingLocalDataSource>
        >
    with
        $FutureModifier<OnboardingLocalDataSource>,
        $FutureProvider<OnboardingLocalDataSource> {
  const OnboardingLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<OnboardingLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<OnboardingLocalDataSource> create(Ref ref) {
    return onboardingLocalDataSource(ref);
  }
}

String _$onboardingLocalDataSourceHash() =>
    r'116b55a477a77c9847e456bbbef6ff69a522ac2c';

@ProviderFor(onboardingRepository)
const onboardingRepositoryProvider = OnboardingRepositoryProvider._();

final class OnboardingRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<OnboardingRepository>,
          OnboardingRepository,
          FutureOr<OnboardingRepository>
        >
    with
        $FutureModifier<OnboardingRepository>,
        $FutureProvider<OnboardingRepository> {
  const OnboardingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<OnboardingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<OnboardingRepository> create(Ref ref) {
    return onboardingRepository(ref);
  }
}

String _$onboardingRepositoryHash() =>
    r'20ef4bf5131f56051916e9e80b2f4138500d523e';
