import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
  (ref) => SharedPreferences.getInstance(),
);

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
