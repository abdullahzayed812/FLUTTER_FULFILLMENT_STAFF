import 'package:flutter/material.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.bigNavBar,
    required this.homeBg,
  });

  final String? bigNavBar;
  final String? homeBg;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? bigNavBar,
    String? homeBg,
  }) {
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  @override
  ThemeExtension<MyAssets> lerp(
    covariant ThemeExtension<MyAssets>? other,
    double t,
  ) {
    if (other is! MyAssets) {
      return this;
    }
    return MyAssets(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  // static MyAssets dark = MyAssets(
  //   bigNavBar: AppImages.images.customer.bigNavBarDark.path,
  //   homeBg: AppImages.images.customer.homeBgDark.path,
  // );
  // static MyAssets light = MyAssets(
  //   bigNavBar: AppImages.images.customer.bigNavBarLight.path,
  //   homeBg: AppImages.images.customer.homeBgLight.path,
  // );
}
