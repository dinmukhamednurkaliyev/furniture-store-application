import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository_provider.g.dart';

@riverpod
Future<AuthenticationLocalDataSource> authenticationLocalDataSource(
  Ref ref,
) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return AuthenticationLocalDataSourceImplementation(
    sharedPreferences,
  );
}

@riverpod
Future<AuthenticationRepository> authenticationRepository(
  Ref ref,
) async {
  final localDataSource = await ref.watch(
    authenticationLocalDataSourceProvider.future,
  );
  return AuthenticationRepositoryImplementation(
    localDataSource,
  );
}
