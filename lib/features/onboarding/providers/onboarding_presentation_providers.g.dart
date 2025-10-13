// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_presentation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingItems)
const onboardingItemsProvider = OnboardingItemsProvider._();

final class OnboardingItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OnboardingItemEntity>>,
          List<OnboardingItemEntity>,
          FutureOr<List<OnboardingItemEntity>>
        >
    with
        $FutureModifier<List<OnboardingItemEntity>>,
        $FutureProvider<List<OnboardingItemEntity>> {
  const OnboardingItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<OnboardingItemEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OnboardingItemEntity>> create(Ref ref) {
    return onboardingItems(ref);
  }
}

String _$onboardingItemsHash() => r'347ca97156f5cf72b62e1ee95eb3958ec368de26';
