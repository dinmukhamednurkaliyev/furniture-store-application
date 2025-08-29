import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/providers/shared_preferences_provider.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

final authenticationLocalDataSourceProvider =
    FutureProvider<AuthenticationLocalDataSource>((ref) async {
      final prefs = await ref.watch(sharedPreferencesProvider.future);
      return AuthenticationLocalDataSourceImplementation(prefs);
    });

final authenticationRepositoryProvider =
    FutureProvider<AuthenticationRepository>((ref) async {
      final localDataSource = await ref.watch(
        authenticationLocalDataSourceProvider.future,
      );
      return AuthenticationRepositoryImplementation(localDataSource);
    });
