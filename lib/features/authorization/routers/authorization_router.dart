import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/pages/sign_in_page.dart';
import 'package:go_router/go_router.dart';

final signInRoutes = [
  GoRoute(
    path: ApplicationRoutes.signIn,
    name: 'sign_in',
    pageBuilder: (context, state) {
      return FadeTransitionPage(
        key: state.pageKey,
        child: const SignInPage(),
      );
    },
  ),
];
