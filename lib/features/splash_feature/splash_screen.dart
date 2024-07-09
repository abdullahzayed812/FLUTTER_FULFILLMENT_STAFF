import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/util/style/images/assets.gen.dart';
import 'package:postage_staff/features/home_test_feature/view/home_test_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String path = '/SplashView';

  @override
  //test
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // DynamicLinkService().handleDynamicLinks(context);
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      context.pushReplacementNamed(HomeTestView.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          AppImages.icons.splachScreen.path,
          // 'assets/icons/splach_screen.png',
          fit: BoxFit.cover,
          height: context.height,
          width: context.width,
        ),
      ),
    );
  }
}
