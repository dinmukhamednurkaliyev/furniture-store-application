// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthenticationNotifier)
const authenticationProvider = AuthenticationNotifierProvider._();

final class AuthenticationNotifierProvider
    extends $AsyncNotifierProvider<AuthenticationNotifier, UserEntity?> {
  const AuthenticationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authenticationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authenticationNotifierHash();

  @$internal
  @override
  AuthenticationNotifier create() => AuthenticationNotifier();
}

String _$authenticationNotifierHash() =>
    r'28fb2dc198ac84c69d814f6c9acba28bfb7afc8f';

abstract class _$AuthenticationNotifier extends $AsyncNotifier<UserEntity?> {
  FutureOr<UserEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserEntity?>, UserEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity?>, UserEntity?>,
              AsyncValue<UserEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
