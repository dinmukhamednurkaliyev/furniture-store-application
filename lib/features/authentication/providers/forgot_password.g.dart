// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ForgotPassword)
const forgotPasswordProvider = ForgotPasswordProvider._();

final class ForgotPasswordProvider
    extends $AsyncNotifierProvider<ForgotPassword, void> {
  const ForgotPasswordProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forgotPasswordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forgotPasswordHash();

  @$internal
  @override
  ForgotPassword create() => ForgotPassword();
}

String _$forgotPasswordHash() => r'3fc9079058cbe085500f25382a2296a577dbf3b7';

abstract class _$ForgotPassword extends $AsyncNotifier<void> {
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
