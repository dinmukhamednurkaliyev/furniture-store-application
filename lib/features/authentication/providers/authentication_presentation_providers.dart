import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod/riverpod.dart';

final authenticationNotifierProvider =
    NotifierProvider<AuthenticationNotifier, AuthenticationState>(
      AuthenticationNotifier.new,
    );
