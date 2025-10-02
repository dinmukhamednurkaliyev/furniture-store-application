import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RouterObserver extends NavigatorObserver {
  final _log = Logger('RouterObserver');

  @override
  void didPush(Route<Object?> route, Route<Object?>? previousRoute) {
    super.didPush(route, previousRoute);
    _log.info(
      'Route pushed: ${route.settings.name} (from: ${previousRoute?.settings.name})',
    );
  }

  @override
  void didPop(Route<Object?> route, Route<Object?>? previousRoute) {
    super.didPop(route, previousRoute);
    _log.info(
      'Route popped: ${route.settings.name} (to: ${previousRoute?.settings.name})',
    );
  }

  @override
  void didRemove(Route<Object?> route, Route<Object?>? previousRoute) {
    super.didRemove(route, previousRoute);
    _log.info(
      'Route removed: ${route.settings.name} (previous: ${previousRoute?.settings.name})',
    );
  }

  @override
  void didReplace({Route<Object?>? newRoute, Route<Object?>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _log.info(
      'Route replaced: from ${oldRoute?.settings.name} to ${newRoute?.settings.name}',
    );
  }
}
