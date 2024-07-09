// import 'package:clean_arc/core/presentation/util/style/colors/color_dark.dart';
// import 'package:clean_arc/core/presentation/util/style/colors/color_ligh.dart';
// import 'package:clean_arc/core/utils_package/utils_package.dart';

import 'package:flutter/material.dart';
import 'package:postage_staff/core/presentation/util/style/colors/color_dark.dart';
import 'package:postage_staff/core/presentation/util/style/colors/color_ligh.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.borderColor,
    required this.primaryColor,
    required this.colorGrey,
    required this.lightGrey,
    required this.lightGrey1,
    required this.textColor,
    required this.colordeepGrey,
    required this.colorLightGrey,
    required this.colorWhiteA,
    required this.greyText,
    required this.greyBorder,
    required this.colorBlack,
    required this.iconColor,
    required this.colorYellow,
    required this.textFieldBorder,
    required this.colorGreyLight,
    required this.categoryColor,
    required this.containerShadow1,
    required this.hintColor,
  });

  final Color? mainColor;
  final Color? borderColor;
  final Color primaryColor;
  final Color? colorGrey;
  final Color? lightGrey;
  final Color? lightGrey1;
  final Color? textColor;
  final Color? colordeepGrey;
  final Color? colorLightGrey;
  final Color? colorWhiteA;
  final Color? greyText;
  final Color? greyBorder;
  final Color? colorBlack;
  final Color? iconColor;
  final Color? colorYellow;
  final Color? textFieldBorder;
  final Color? colorGreyLight;
  final Color? categoryColor;
  final Color? containerShadow1;
  final Color? hintColor;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? borderColor,
    Color? primaryColor,
    Color? colorGrey,
    Color? lightGrey,
    Color? lightGrey1,
    Color? textColor,
    Color? colordeepGrey,
    Color? colorLightGrey,
    Color? colorWhiteA,
    Color? greyText,
    Color? greyBorder,
    Color? colorBlack,
    Color? iconColor,
    Color? colorYellow,
    Color? textFieldBorder,
    Color? colorGreyLight,
    Color? categoryColor,
    Color? containerShadow1,
    Color? hintColor,
  }) {
    return MyColors(
      mainColor: mainColor,
      borderColor: borderColor,
      primaryColor: primaryColor!,
      colorGrey: colorGrey,
      lightGrey: lightGrey,
      lightGrey1: lightGrey1,
      textColor: textColor,
      colordeepGrey: colordeepGrey,
      colorLightGrey: colorLightGrey,
      colorWhiteA: colorWhiteA,
      greyText: greyText,
      greyBorder: greyBorder,
      colorBlack: colorBlack,
      iconColor: iconColor,
      colorYellow: colorYellow,
      textFieldBorder: textFieldBorder,
      colorGreyLight: colorGreyLight,
      containerShadow1: containerShadow1,
      categoryColor: categoryColor,
      hintColor: hintColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      borderColor: borderColor,
      primaryColor: primaryColor,
      colorGrey: colorGrey,
      lightGrey: lightGrey,
      lightGrey1: lightGrey1,
      textColor: textColor,
      colordeepGrey: colordeepGrey,
      colorLightGrey: colorLightGrey,
      colorWhiteA: colorWhiteA,
      greyText: greyText,
      greyBorder: greyBorder,
      colorBlack: colorBlack,
      iconColor: iconColor,
      colorYellow: colorYellow,
      textFieldBorder: textFieldBorder,
      colorGreyLight: colorGreyLight,
      containerShadow1: containerShadow1,
      categoryColor: categoryColor,
      hintColor: hintColor,
    );
  }

  static MyColors light = const MyColors(
    mainColor: ColorsLight.mainColor,
    borderColor: ColorsLight.borderColor,
    primaryColor: ColorsLight.primaryColor,
    colorGrey: ColorsLight.colorGrey,
    lightGrey: ColorsLight.lightGrey,
    lightGrey1: ColorsLight.lightGrey1,
    textColor: ColorsLight.textColor,
    colordeepGrey: ColorsLight.colordeepGrey,
    colorLightGrey: ColorsLight.colorLightGrey,
    colorWhiteA: ColorsLight.colorWhiteA,
    greyText: ColorsLight.greyText,
    greyBorder: ColorsLight.greyBorder,
    colorBlack: ColorsLight.colorBlack,
    iconColor: ColorsLight.iconColor,
    colorYellow: ColorsLight.colorYellow,
    textFieldBorder: ColorsLight.textFieldBorder,
    colorGreyLight: ColorsLight.colorGreyLight,
    categoryColor: ColorsLight.categoryColor,
    containerShadow1: ColorsLight.containerShadow1,
    hintColor: ColorsLight.hintColor,
  );

  static MyColors dark = const MyColors(
    mainColor: ColorsLight.mainColor,
    borderColor: ColorsLight.borderColor,
    primaryColor: ColorsDark.primaryColor,
    colorGrey: ColorsDark.colorGrey,
    lightGrey: ColorsDark.lightGrey,
    lightGrey1: ColorsDark.lightGrey1,
    textColor: ColorsDark.textColor,
    colordeepGrey: ColorsDark.colordeepGrey,
    colorLightGrey: ColorsDark.colorLightGrey,
    colorWhiteA: ColorsDark.colorWhiteA,
    greyText: ColorsDark.greyText,
    greyBorder: ColorsDark.greyBorder,
    colorBlack: ColorsDark.colorBlack,
    iconColor: ColorsDark.iconColor,
    colorYellow: ColorsDark.colorYellow,
    textFieldBorder: ColorsDark.textFieldBorder,
    colorGreyLight: ColorsDark.colorGreyLight,
    containerShadow1: ColorsDark.containerShadow1,
    categoryColor: ColorsDark.categoryColor,
    hintColor: ColorsDark.hintColor,
  );
}
