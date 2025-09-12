import 'package:furniture_store_application/features/application/application.dart';
import 'package:go_router/go_router.dart';

class SplashRoute {
  static const String path = '/';
  static const String name = 'splash';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const SplashPage(),
  );
}
