import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

final authorizationLocalDataSourceProvider =
    Provider<AuthorizationLocalDataSource>((
      ref,
    ) {
      final sharedPreferences = ref
          .watch(sharedPreferencesProvider)
          .valueOrNull;

      if (sharedPreferences == null) {
        throw Exception('SharedPreferences not initialized yet');
      }

      return AuthorizationLocalDataSourceImplementation(
        sharedPreferences: sharedPreferences,
      );
    });

final authorizationRepositoryProvider = Provider<AuthorizationRepository>((
  ref,
) {
  final localDataSource = ref.watch(
    authorizationLocalDataSourceProvider,
  );

  return AuthorizationRepositoryImplementation(
    localDataSource: localDataSource,
  );
});

final getAuthorizationStatusProvider = Provider<GetAuthorizationStatusUsecase>((
  ref,
) {
  final repository = ref.watch(authorizationRepositoryProvider);

  return GetAuthorizationStatusUsecase(repository);
});
