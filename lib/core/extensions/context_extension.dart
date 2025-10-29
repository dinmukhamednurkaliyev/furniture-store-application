import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/theme/application_dimensions.dart';

extension ThemeExtensions on BuildContext {
  Color get hintColor => theme.hintColor;

  Color? get iconThemeColor => theme.iconTheme.color;

  ApplicationPaddingTheme get paddingValues =>
      Theme.of(this).extension<ApplicationPaddingTheme>()!;
  ApplicationRadiusTheme get radiusValues =>
      Theme.of(this).extension<ApplicationRadiusTheme>()!;
  ApplicationSpacingTheme get spacingValues =>
      Theme.of(this).extension<ApplicationSpacingTheme>()!;
}

extension NaviatorExtensions on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}
