import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/setting/setting.dart';

class ApplicationlicationStateProvider with ChangeNotifier {
  ApplicationlicationStateProvider({
    required GetHasSeenOnboarding getHasSeenOnboarding,
    required SetOnboardingSeen setOnboardingSeen,
  }) : _getHasSeenOnboarding = getHasSeenOnboarding,
       _setOnboardingSeen = setOnboardingSeen;
  final GetHasSeenOnboarding _getHasSeenOnboarding;
  final SetOnboardingSeen _setOnboardingSeen;

  ApplicationState _state = ApplicationInitial();
  ApplicationState get state => _state;

  Future<void> initializeApplication() async {
    _state = ApplicationLoading();
    notifyListeners();

    final result = await _getHasSeenOnboarding();

    switch (result) {
      case Success(data: final hasSeen):
        _state = ApplicationReady(hasSeenOnboarding: hasSeen);
      case Error(failure: final _):
        _state = const ApplicationReady(hasSeenOnboarding: false);
    }
    notifyListeners();
  }

  Future<void> markOnboardingSeen() async {
    if (_state is! ApplicationReady) return;

    await _setOnboardingSeen();

    _state = const ApplicationReady(hasSeenOnboarding: true);
    notifyListeners();
  }
}
