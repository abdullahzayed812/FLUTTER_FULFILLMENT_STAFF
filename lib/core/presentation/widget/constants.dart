import 'package:flutter/material.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';

AppBar customAppbar({
  required String title,
  required BuildContext context,
  VoidCallback? press,
  bool? atHome,
  bool isArrow = false,
  List<Widget>? actions,
  Color? color,
  Color? textColor,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    shadowColor: context.color.colorGreyLight!.withOpacity(0.5),
    // scrolledUnderElevation: 2,
    bottom: bottom,
    elevation: 1.5,
    backgroundColor: color ?? Colors.white,
    centerTitle: true,
    automaticallyImplyLeading: false,
    title: TextApp(
      title,
      style: context.textStyle.copyWith(
        color: textColor ?? context.color.colorBlack,
        fontWeight: FontWeight.w600,
        fontSize: MediaQuery.of(context).size.width * 0.04,
      ),
    ),
    leading: ((atHome ?? false) == true)
        ? null
        : InkWell(
            onTap: press ?? () => Navigator.pop(context),
            child: isArrow
                ? Icon(
                    Icons.arrow_back,
                    size: context.width * 0.06,
                    color: textColor ?? context.color.colorBlack,
                  )
                : Container(),
          ),
    actions: actions ??
        [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Icon(
              Icons.arrow_forward,
              size: context.width * 0.06,
              color: Colors.black,
            ),
          ),
        ],
  );
}

Future<dynamic> homeBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  final w = MediaQuery.of(context).size.width;
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(w * 0.06),
        topLeft: Radius.circular(w * 0.06),
      ),
    ),
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    builder: (context) =>
        Padding(padding: MediaQuery.of(context).viewInsets, child: child),
  );
}
