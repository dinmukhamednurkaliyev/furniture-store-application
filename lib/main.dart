import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/features.dart';

Future<void> main() async {
  await ApplicationBootstrap.run(
    applicationBuilder: () =>
        const ProviderScope(child: ApplicationRootWidget()),
  );
}
