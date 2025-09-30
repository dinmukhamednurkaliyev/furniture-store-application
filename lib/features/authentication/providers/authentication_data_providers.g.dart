// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authenticationLocalDataSource)
const authenticationLocalDataSourceProvider =
    AuthenticationLocalDataSourceProvider._();

final class AuthenticationLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthenticationLocalDataSource>,
          AuthenticationLocalDataSource,
          FutureOr<AuthenticationLocalDataSource>
        >
    with
        $FutureModifier<AuthenticationLocalDataSource>,
        $FutureProvider<AuthenticationLocalDataSource> {
  const AuthenticationLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<AuthenticationLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthenticationLocalDataSource> create(Ref ref) {
    return authenticationLocalDataSource(ref);
  }
}

String _$authenticationLocalDataSourceHash() =>
    r'9496084cf53b10fcb3f9d13ef13253f0b30a9ee6';

@ProviderFor(authenticationRepository)
const authenticationRepositoryProvider = AuthenticationRepositoryProvider._();

final class AuthenticationRepositoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthenticationRepository>,
          AuthenticationRepository,
          FutureOr<AuthenticationRepository>
        >
    with
        $FutureModifier<AuthenticationRepository>,
        $FutureProvider<AuthenticationRepository> {
  const AuthenticationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<AuthenticationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthenticationRepository> create(Ref ref) {
    return authenticationRepository(ref);
  }
}

String _$authenticationRepositoryHash() =>
    r'e50893ec713b457111aa2431c8bba7db6956fe36';
