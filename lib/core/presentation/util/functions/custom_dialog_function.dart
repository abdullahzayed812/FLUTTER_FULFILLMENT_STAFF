import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';


void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: 'Barrier',
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40),),
          child: const SizedBox.expand(child: FlutterLogo()),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

int count = 60;

Stream<int> time() {
  count = 60;
  final event = StreamController<int>();
  event.add(60);
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (count > 0) {
      count--;
      event.add(count);
      debugPrint('$count');
    } else {
      timer.cancel();
      event.close();
    }
  });
  return event.stream;
}

Future<void> customDialog(BuildContext context, {void Function()? onTap}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(context.width * 0.05),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder(
          stream: time(),
          builder: (context, snap) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const TextApp(
                  // context.translate.pleaseEnterTheAddress
                  'برجاء الدخول إلى البريد الإلكتروني لتنشيط الحساب ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextApp(
                  'هل تريد اعاده الإرسال إلى البريد؟',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const TextApp(
                        'الغاء',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: snap.data == 0 ? onTap : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const TextApp('إعادة الارسال'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextApp(
                      '${snap.data} ',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const TextApp(
                      'أعد الإرسال خلال',
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
////////////////////////////////////////////////////////

Future<void> logOutDialog(BuildContext context, GestureTapCallback onTap) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(context.width * 0.05),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          TextApp(
            'هل انت متأكد انك تريد تسجيل الخروج؟',
            style: context.textStyle.copyWith(
                fontSize: context.width * 0.04,
                fontWeight: FontWeight.bold,
                color: context.color.colorBlack,),
          ),
          const VerticalSpace(value: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: context.height * 0.06,
                width: context.width * 0.37,
                child: CustomGeneralButton(
                  fontWeight: FontWeight.w700,
                  textColor: context.color.primaryColor,
                  fontSize: context.width * 0.038,
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(context.width * 0.08),
                  text: 'الغاء',
                  onTap: () => context.pop(),
                  borderColor: context.color.primaryColor,
                ),
              ),
              SizedBox(
                width: context.width * 0.02,
              ),
              SizedBox(
                height: context.height * 0.06,
                width: context.width * 0.37,
                child: CustomGeneralButton(
                  borderRadius:
                      BorderRadius.circular(context.width * 0.08),
                  color: context.color.primaryColor,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  fontSize: context.width * 0.038,
                  text: 'تسجيل الخروج',
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/////////////////////////////////////////////////////////

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(0, 15, 15, 10),
      title: const TextApp(
        'يجب تسجيل الدخول اولا',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // MagicRouter.navigateTo( LayoutScreen(index:1 ,));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
          ),
          child: const TextApp(
            'الغاء',
            style: TextStyle(color: Colors.green),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            //  MagicRouter.navigateTo(const ToggleScreen());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const TextApp(
            'تسجيل الدخول',
            style: TextStyle(/*color:AppColors.primaryColor*/),
          ),
        ),
      ],
    );
  }
}
