import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await ApplicationBootstrap.run(
    container: container,
    applicationBuilder: () => UncontrolledProviderScope(
      container: container,
      child: const ApplicationRootWidget(),
    ),
  );
}
