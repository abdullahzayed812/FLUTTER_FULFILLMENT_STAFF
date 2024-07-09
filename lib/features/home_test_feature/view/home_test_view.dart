import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/util/style/images/assets.gen.dart';
import 'package:postage_staff/core/presentation/widget/constants.dart';
import 'package:postage_staff/core/presentation/widget/dark_and_lang_button.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';

class HomeTestView extends StatelessWidget {
  const HomeTestView({super.key});

  static const String path = '/HomeTestFeature';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customAppbar(title: context.translate.localeName, context: context),
              TextApp(
                context.translate.scan,
                style: context.textStyle.copyWith(
                    fontSize: AppDimensions.fontSizeDefault,
                    color: context.color.textColor),
              ),
              VerticalSpace(value: 10),
              DarkAndLangButtons(),
              VerticalSpace(value: 10),
              AppImages.icons.whatsapp.image(height: 100.h),
              VerticalSpace(value: 10),
              AppImages.icons.json.scan.lottie(height: 100.h)
            ],
          ),
        ),
      ),
    );
  }
}
