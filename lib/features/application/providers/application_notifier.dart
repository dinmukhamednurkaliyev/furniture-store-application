import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';

class ApplicationNotifier extends Notifier<ApplicationState> {
  @override
  ApplicationState build() {
    return const ApplicationState();
  }
}
