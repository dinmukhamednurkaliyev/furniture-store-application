import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod/riverpod.dart';

final getSignInStatusUsecaseProvider = Provider<GetSignInStatusUsecase>(
  (ref) => GetSignInStatusUsecase(ref.watch(authenticationRepositoryProvider)),
);

final getUserUsecaseProvder = Provider<GetUserUsecase>(
  (ref) => GetUserUsecase(ref.watch(authenticationRepositoryProvider)),
);

final setSignInStatusUsecaseProvider = Provider<SetSignInStatusUsecase>(
  (ref) => SetSignInStatusUsecase(ref.watch(authenticationRepositoryProvider)),
);

final setUserUsecaseProvider = Provider<SetUserUsecase>(
  (ref) => SetUserUsecase(ref.watch(authenticationRepositoryProvider)),
);
