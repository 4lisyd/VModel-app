import 'package:flutter/material.dart';
import 'package:vmodel/src/res/res.dart';

class VModelTheme {
  static ThemeData get lightMode => ThemeData(
      splashColor: Colors.transparent,
      primaryColor: VmodelColors.primaryColor,
      scaffoldBackgroundColor: VmodelColors.background,
      primarySwatch: VmodelColors.vModelprimarySwatch,
      fontFamily: VModelTypography1.primaryfontName,
      textTheme: TextTheme(
        displayLarge: VModelTypography1.normalTextStyle,
        displayMedium: VModelTypography1.mediumTextStyle,
        displaySmall: VModelTypography1.smallTextStyle,
        titleLarge: VModelTypography1.normalTextStyle,
        titleMedium: VModelTypography1.normalTextStyle,
        titleSmall: VModelTypography1.normalTextStyle,
        // bodyLarge: VModelTypography1.normalTextStyle,
        // bodyMedium: VModelTypography1.mediumTextStyle,
        // bodySmall: VModelTypography1.smallTextStyle,
      ));

  static ThemeData get darkTneme => ThemeData(
      splashColor: Colors.transparent,
      colorScheme: const ColorScheme.dark(primary: VmodelColors.primaryColor),
      scaffoldBackgroundColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: VmodelColors.primaryColor,
      primarySwatch: VmodelColors.vModelprimarySwatch,
      fontFamily: VModelTypography1.primaryfontName,
      textTheme: TextTheme(
        displayLarge: VModelTypography1.normalTextStyle,
        displayMedium: VModelTypography1.mediumTextStyle,
        displaySmall: VModelTypography1.smallTextStyle,
        titleLarge: VModelTypography1.normalTextStyle,
        titleMedium: VModelTypography1.normalTextStyle,
        titleSmall: VModelTypography1.normalTextStyle,
        // bodyLarge: VModelTypography1.normalTextStyle,
        // bodyMedium: VModelTypography1.mediumTextStyle,
        // bodySmall: VModelTypography1.smallTextStyle,
      ));
}
