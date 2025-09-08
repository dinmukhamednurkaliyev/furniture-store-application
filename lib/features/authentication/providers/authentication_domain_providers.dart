import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

final getSignInStatusUsecaseProvider = FutureProvider<GetSignInStatusUsecase>((
  ref,
) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return GetSignInStatusUsecase(repository);
});

final getUserUsecaseProvider = FutureProvider<GetUserUsecase>((ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return GetUserUsecase(repository);
});

final setSignInStatusUsecaseProvider = FutureProvider<SetSignInStatusUsecase>((
  ref,
) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return SetSignInStatusUsecase(repository);
});

final setUserUsecaseProvider = FutureProvider<SetUserUsecase>((ref) async {
  final repository = await ref.watch(authenticationRepositoryProvider.future);
  return SetUserUsecase(repository);
});

final resetPasswordUsecaseProvider = FutureProvider<ResetPasswordUsecase>(
  (ref) async {
    final repository = await ref.watch(authenticationRepositoryProvider.future);
    return ResetPasswordUsecase(repository);
  },
);
