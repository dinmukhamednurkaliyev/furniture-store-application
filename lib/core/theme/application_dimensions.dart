import 'package:flutter/material.dart';

double _lerp(double a, double b, double t) => a + (b - a) * t;

@immutable
class ApplicationPaddingTheme extends ThemeExtension<ApplicationPaddingTheme> {
  const ApplicationPaddingTheme({
    this.xsmall = 4.0,
    this.small = 8.0,
    this.medium = 12.0,
    this.large = 16.0,
    this.xlarge = 24.0,
    this.xxlarge = 32.0,
  });

  final double xsmall;
  final double small;
  final double medium;
  final double large;
  final double xlarge;
  final double xxlarge;

  EdgeInsets get allXSmall => EdgeInsets.all(xsmall);
  EdgeInsets get allSmall => EdgeInsets.all(small);
  EdgeInsets get allMedium => EdgeInsets.all(medium);
  EdgeInsets get allLarge => EdgeInsets.all(large);
  EdgeInsets get allXLarge => EdgeInsets.all(xlarge);

  EdgeInsets get hSmall => EdgeInsets.symmetric(horizontal: small);
  EdgeInsets get hMedium => EdgeInsets.symmetric(horizontal: medium);
  EdgeInsets get hLarge => EdgeInsets.symmetric(horizontal: large);
  EdgeInsets get hXLarge => EdgeInsets.symmetric(horizontal: xlarge);
  EdgeInsets get hXXLarge => EdgeInsets.symmetric(horizontal: xxlarge);

  EdgeInsets get vSmall => EdgeInsets.symmetric(vertical: small);
  EdgeInsets get vMedium => EdgeInsets.symmetric(vertical: medium);
  EdgeInsets get vLarge => EdgeInsets.symmetric(vertical: large);

  @override
  ApplicationPaddingTheme copyWith({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
  }) {
    return ApplicationPaddingTheme(
      xsmall: xsmall ?? this.xsmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      xlarge: xlarge ?? this.xlarge,
      xxlarge: xxlarge ?? this.xxlarge,
    );
  }

  @override
  ApplicationPaddingTheme lerp(
    covariant ApplicationPaddingTheme? other,
    double t,
  ) {
    if (other is! ApplicationPaddingTheme) return this;
    return ApplicationPaddingTheme(
      xsmall: _lerp(xsmall, other.xsmall, t),
      small: _lerp(small, other.small, t),
      medium: _lerp(medium, other.medium, t),
      large: _lerp(large, other.large, t),
      xlarge: _lerp(xlarge, other.xlarge, t),
      xxlarge: _lerp(xxlarge, other.xxlarge, t),
    );
  }
}

@immutable
class ApplicationRadiusTheme extends ThemeExtension<ApplicationRadiusTheme> {
  const ApplicationRadiusTheme({
    this.small = 8.0,
    this.medium = 12.0,
    this.large = 16.0,
    this.xlarge = 20.0,
    this.xxlarge = 30.0,
  });

  final double small;
  final double medium;
  final double large;
  final double xlarge;
  final double xxlarge;

  BorderRadius get circularSmall => BorderRadius.circular(small);
  BorderRadius get circularMedium => BorderRadius.circular(medium);
  BorderRadius get circularLarge => BorderRadius.circular(large);
  BorderRadius get circularXLarge => BorderRadius.circular(xlarge);
  BorderRadius get circularXXLarge => BorderRadius.circular(xxlarge);

  @override
  ApplicationRadiusTheme copyWith({
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
  }) {
    return ApplicationRadiusTheme(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      xlarge: xlarge ?? this.xlarge,
      xxlarge: xxlarge ?? this.xxlarge,
    );
  }

  @override
  ApplicationRadiusTheme lerp(
    covariant ApplicationRadiusTheme? other,
    double t,
  ) {
    if (other is! ApplicationRadiusTheme) return this;
    return ApplicationRadiusTheme(
      small: _lerp(small, other.small, t),
      medium: _lerp(medium, other.medium, t),
      large: _lerp(large, other.large, t),
      xlarge: _lerp(xlarge, other.xlarge, t),
      xxlarge: _lerp(xxlarge, other.xxlarge, t),
    );
  }
}

@immutable
class ApplicationSpacingTheme extends ThemeExtension<ApplicationSpacingTheme> {
  const ApplicationSpacingTheme({
    this.xsmall = 4.0,
    this.small = 8.0,
    this.medium = 12.0,
    this.large = 16.0,
    this.xlarge = 20.0,
    this.xxlarge = 24.0,
    this.xxxlarge = 48.0,
  });

  final double xsmall;
  final double small;
  final double medium;
  final double large;
  final double xlarge;
  final double xxlarge;
  final double xxxlarge;

  Widget get verticalXSmall => SizedBox(height: xsmall);
  Widget get verticalSmall => SizedBox(height: small);
  Widget get verticalMedium => SizedBox(height: medium);
  Widget get verticalLarge => SizedBox(height: large);
  Widget get verticalXLarge => SizedBox(height: xlarge);
  Widget get verticalXXLarge => SizedBox(height: xxlarge);
  Widget get verticalXXXLarge => SizedBox(height: xxxlarge);

  Widget get horizontalXSmall => SizedBox(width: xsmall);
  Widget get horizontalSmall => SizedBox(width: small);
  Widget get horizontalMedium => SizedBox(width: medium);
  Widget get horizontalLarge => SizedBox(width: large);
  Widget get horizontalXLarge => SizedBox(width: xlarge);
  Widget get horizontalXXLarge => SizedBox(width: xxlarge);
  Widget get horizontalXXXLarge => SizedBox(width: xxxlarge);

  @override
  ApplicationSpacingTheme copyWith({
    double? xsmall,
    double? small,
    double? medium,
    double? large,
    double? xlarge,
    double? xxlarge,
    double? xxxlarge,
  }) {
    return ApplicationSpacingTheme(
      xsmall: xsmall ?? this.xsmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      xlarge: xlarge ?? this.xlarge,
      xxlarge: xxlarge ?? this.xxlarge,
      xxxlarge: xxxlarge ?? this.xxxlarge,
    );
  }

  @override
  ApplicationSpacingTheme lerp(
    covariant ApplicationSpacingTheme? other,
    double t,
  ) {
    if (other is! ApplicationSpacingTheme) return this;
    return ApplicationSpacingTheme(
      xsmall: _lerp(xsmall, other.xsmall, t),
      small: _lerp(small, other.small, t),
      medium: _lerp(medium, other.medium, t),
      large: _lerp(large, other.large, t),
      xlarge: _lerp(xlarge, other.xlarge, t),
      xxlarge: _lerp(xxlarge, other.xxlarge, t),
      xxxlarge: _lerp(xxxlarge, other.xxxlarge, t),
    );
  }
}
