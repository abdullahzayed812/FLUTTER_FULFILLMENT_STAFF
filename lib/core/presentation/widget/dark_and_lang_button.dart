import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postage_staff/core/app/app_cubit/app_cubit.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/widget/custom_button_button.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';


class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark Mode Button
        BlocBuilder( 
          bloc: cubit,
          builder: (context, state) {
            // print(cubit.isDark);
            return CustomFadeInRight(
              duration: 400,
              child: CustomButton(
                onPressed: cubit.changeAppThemeMode2,
                child: Icon(
                  cubit.isDark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        //Language Button
        CustomFadeInLeft(
          duration: 400,
          child: CustomButton(
            onPressed: () {
              if (context.isEnLocale) {
                cubit.toArabic();
              } else {
                cubit.toEnglish();
              }
            },
            height: 44.h,
            width: 100.w,
            child: TextApp(
               context.translate.localeName,
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
