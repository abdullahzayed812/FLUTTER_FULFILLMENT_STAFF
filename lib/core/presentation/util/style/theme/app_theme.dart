import 'package:flutter/material.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/util/style/fonts/font_family_helper.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: <ThemeExtension<dynamic>>[
      MyColors.dark,
      // , MyAssets.dark
    ],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    fontFamily: 'cairo',
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: <ThemeExtension<dynamic>>[
      MyColors.light,
      // MyAssets.light
    ],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsLight.textColor,
        fontFamily: FontFamilyHelper.geLocalozedFontFamily(),
      ),
    ),
  );
}
