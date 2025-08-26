import 'package:furniture_store_application/features/authorization/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';

final authorizationRoutes = [
  GoRoute(
    path: '/sign_in',
    name: 'sign_in',
    builder: (context, state) => const SignInPage(),
  ),
];
