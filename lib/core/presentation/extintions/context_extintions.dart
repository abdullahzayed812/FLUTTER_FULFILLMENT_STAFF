import 'package:flutter/material.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/translation/translations.dart';

extension ContextExt on BuildContext {
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;

  Translations get translate => Translations.of(this)!;

  bool get isEnLocale => Translations.of(this)?.localeName == 'en';

  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  TextStyle get textStyleButton =>
      Theme.of(this).textTheme.displaySmall!.copyWith(
            fontSize: AppDimensions.fontSizeLarge,
            color: Colors.white,
            fontWeight: FontWeightHelper.semiBold,
          );

  ///=======================  Sizes =========================================ئ

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
