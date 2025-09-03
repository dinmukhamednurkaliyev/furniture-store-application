import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

final authenticationNotifierProvider =
    NotifierProvider<AuthenticationNotifier, AsyncValue<UserEntity?>>(
      AuthenticationNotifier.new,
    );
