import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/features.dart';

void main() {
  ApplicationBootstrap.run(
    applicationBuilder: () =>
        const ProviderScope(child: ApplicationRootWidget()),
  );
}
