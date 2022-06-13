import 'package:flutter/material.dart';

class Constants {
  static const String globalFontFamily = 'OpenSans';
  static const String headingFontFamily = 'Poppins-Bold';

  static const String logoPath = 'assets/images/logo.png';
  static const String bgPath = 'assets/images/bg.png';

  static const Color backgroundColor = Color(0xFFF4F5F9);
  static const Color foregroundColor = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFFA82216);
  static const Color borderColor = Color(0x1A000000);
  static const Color titleColor = Color(0xFF303133);
  static const Color subtitleColor = Color(0xFF6878d6);
  static const Color subheadingColor = Color(0xFFD0D8EA);

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: foregroundColor,
    secondary: primaryColor,
    onSecondary: foregroundColor,
    error: primaryColor,
    onError: foregroundColor,
    background: backgroundColor,
    onBackground: foregroundColor,
    surface: foregroundColor,
    onSurface: titleColor,
  );

  static const double borderRadius = 10.0;

  static const defaultAvatarUrl =
      'https://ahlanmagz.com/wp-content/uploads/2020/12/cropped-logo-60x60.png';
}
