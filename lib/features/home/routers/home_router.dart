import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final homeRoutes = [
  GoRoute(
    path: '/home',
    name: 'home',
    pageBuilder: (context, state) {
      return FadeTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
  ),
];
