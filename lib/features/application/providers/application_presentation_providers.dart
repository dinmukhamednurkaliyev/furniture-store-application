import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';

final applicationNotifierProvider =
    NotifierProvider<ApplicationNotifier, ApplicationState>(
      ApplicationNotifier.new,
    );
