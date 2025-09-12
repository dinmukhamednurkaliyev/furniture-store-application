import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return ApplicationRouter().router;
});
