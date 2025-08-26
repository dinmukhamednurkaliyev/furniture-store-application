import 'package:furniture_store_application/features/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final homeRoutes = [
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const HomePage(),
  ),
];
