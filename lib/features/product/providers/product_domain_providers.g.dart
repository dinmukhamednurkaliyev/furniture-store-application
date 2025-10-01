// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_domain_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getProductsUsecase)
const getProductsUsecaseProvider = GetProductsUsecaseProvider._();

final class GetProductsUsecaseProvider
    extends
        $FunctionalProvider<
          GetProductsUsecase,
          GetProductsUsecase,
          GetProductsUsecase
        >
    with $Provider<GetProductsUsecase> {
  const GetProductsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetProductsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductsUsecase create(Ref ref) {
    return getProductsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductsUsecase>(value),
    );
  }
}

String _$getProductsUsecaseHash() =>
    r'c9a86088f837c6d3c9655d318b797daf0de53515';

@ProviderFor(getCategoriesUsecase)
const getCategoriesUsecaseProvider = GetCategoriesUsecaseProvider._();

final class GetCategoriesUsecaseProvider
    extends
        $FunctionalProvider<
          GetCategoriesUsecase,
          GetCategoriesUsecase,
          GetCategoriesUsecase
        >
    with $Provider<GetCategoriesUsecase> {
  const GetCategoriesUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCategoriesUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCategoriesUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCategoriesUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCategoriesUsecase create(Ref ref) {
    return getCategoriesUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCategoriesUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCategoriesUsecase>(value),
    );
  }
}

String _$getCategoriesUsecaseHash() =>
    r'0074e5dfe1dcbf54b713f6ad1057f1c3b49770da';

@ProviderFor(toggleFavoriteUsecase)
const toggleFavoriteUsecaseProvider = ToggleFavoriteUsecaseProvider._();

final class ToggleFavoriteUsecaseProvider
    extends
        $FunctionalProvider<
          ToggleFavoriteUsecase,
          ToggleFavoriteUsecase,
          ToggleFavoriteUsecase
        >
    with $Provider<ToggleFavoriteUsecase> {
  const ToggleFavoriteUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleFavoriteUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleFavoriteUsecaseHash();

  @$internal
  @override
  $ProviderElement<ToggleFavoriteUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ToggleFavoriteUsecase create(Ref ref) {
    return toggleFavoriteUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleFavoriteUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleFavoriteUsecase>(value),
    );
  }
}

String _$toggleFavoriteUsecaseHash() =>
    r'48ba14050e23ab04b467533b723c0fd13ae93046';
