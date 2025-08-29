import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod/riverpod.dart';

final authenticationLocalDataSourceProvider =
    Provider<AuthenticationLocalDataSource>((ref) {
      final sharedPreferences = ref.watch(sharedPreferencesProvider).value!;
      return AuthenticationLocalDataSourceImplementation(sharedPreferences);
    });

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => AuthenticationRepositoryImplementation(
    ref.watch(authenticationLocalDataSourceProvider),
  ),
);
