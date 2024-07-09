import 'package:flutter/material.dart';
import 'package:postage_staff/core/core_packages.dart';

import 'text_app.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({
    required this.text,
    required this.onTap,
    super.key,
    this.color,
    this.borderColor,
    // this.isActive,
    this.textColor,
    this.iconImage,
    this.withBorder,
    this.size,
    this.fontSize,
    this.imageColor,
    this.borderRadius,
    this.fontWeight,
    this.width,
  });

  final String text;
  final VoidCallback onTap;
  final Color? color;

  // final bool? isActive;
  final IconData? iconImage;
  final Color? textColor;
  final Color? borderColor;
  final Color? imageColor;
  final bool? withBorder;
  final double? size;
  final double? width;

  final FontWeight? fontWeight;
  final BorderRadiusGeometry? borderRadius;

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.06,
        width: width ?? w,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: color,
          borderRadius:
              borderRadius ?? BorderRadius.circular(context.width * 0.015),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconImage != null)
                Icon(
                  iconImage,
                  color: imageColor,
                )
              else
                const SizedBox(),
              if (iconImage != null)
                SizedBox(
                  width: w * 0.03,
                )
              else
                const SizedBox(),
              Center(
                child: TextApp(
                  text,
                  style: context.textStyle.copyWith(
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: textColor ?? Colors.black,
                    fontSize: fontSize ?? context.width * 0.045,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomStrockButton extends StatelessWidget {
  const CustomStrockButton({
    required this.text,
    required this.onTap,
    super.key,
    this.color,
  });

  final String text;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.08,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: context.color.primaryColor,
          ),
        ),
        child: Center(
          child: TextApp(
            text,
            style: TextStyle(
              color: context.color.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    required this.textColor,
    required this.icon,
    required this.text,
    required this.borderColor,
    required this.onTap,
    super.key,
    this.color,
  });

  final Color? color;
  final String icon;
  final String text;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.08,
        width: w,
        padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.02),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Image.asset(
                icon,
                // color: color,
              ),
            ),
            SizedBox(
              width: w * 0.02,
            ),
            TextApp(
              text,
              style: context.textStyle.copyWith(color: textColor),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.size,
    this.color,
    this.isUnderLine,
  });

  final String text;
  final VoidCallback onPressed;
  final double? size;
  final Color? color;
  final bool? isUnderLine;

  @override
  Widget build(BuildContext context) {
    return (isUnderLine ?? false) == true
        ? TextButton(
            onPressed: onPressed,
            child: TextApp(
              text,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: color,
                fontSize: size ?? AppDimensions.fontSizeDefault * 5.5,
              ),
            ),
          )
        : TextButton(
            onPressed: onPressed,
            child: TextApp(
              text,
              style: context.textStyle.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: size ?? AppDimensions.fontSizeDefault * 1.8,
              ),
            ),
          );
  }
}

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton({
    required this.onTap,
    required this.text,
    super.key,
  });

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height * 0.065,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: TextApp(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    required this.path,
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.color,
  });

  final GestureTapCallback? onTap;
  final String path;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        path,
        width: width,
        height: height,
        color: color,
        fit: BoxFit.contain,
      ),
    );
  }
}

// class CustomSvgIcon extends StatelessWidget {
//   const CustomSvgIcon(
//       {super.key,
//       this.onTap,
//       required this.path,
//       this.width,
//       this.height,
//       this.color});
//   final Function()? onTap;
//   final String path;
//   final double? width;
//   final double? height;
//   final Color? color;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: SvgPicture.asset(
//         path,
//         width: width,
//         height: height,
//         color: color,
//         fit: BoxFit.contain,
//       ),
//     );
//   }
// }

class CustomButtonBorder extends StatelessWidget {
  const CustomButtonBorder({
    required this.onTap,
    required this.text,
    super.key,
  });

  final GestureTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        height: context.height * 0.065,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
            width: 0.7,
          ),
        ),
        child: Center(
          child: TextApp(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
