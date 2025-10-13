import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_domain_providers.g.dart';

@riverpod
Future<GetSignInStatusUsecase> getSignInStatusUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return GetSignInStatusUsecase(repository);
}

@riverpod
Future<GetUserUsecase> getUserUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return GetUserUsecase(repository);
}

@riverpod
Future<SetSignInStatusUsecase> setSignInStatusUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return SetSignInStatusUsecase(repository);
}

@riverpod
Future<SetUserUsecase> setUserUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return SetUserUsecase(repository);
}

@riverpod
Future<ResetPasswordUsecase> resetPasswordUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return ResetPasswordUsecase(repository);
}

@riverpod
Future<SignInUsecase> signInUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return SignInUsecase(repository);
}

@riverpod
Future<SignUpUsecase> signUpUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return SignUpUsecase(repository);
}

@riverpod
Future<SignOutUsecase> signOutUsecase(Ref ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return SignOutUsecase(repository);
}
