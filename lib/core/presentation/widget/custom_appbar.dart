import 'package:flutter/material.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    required this.title, super.key,
    // this.onTap
  });

  final String title;

  // final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const SizedBox(),
      centerTitle: true,
      title: TextApp(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      actions: const [
        // Padding(
        //   padding: const EdgeInsets.only(right: 10),
        //   child: CustomSvgIcon(
        //     onTap:onTap?? () {
        //       Navigator.pop(context);
        //     },
        //     path: 'assets/icons/Arrow - Down.svg',
        //     height: 28,
        //     width: 28,
        //   ),
        // ),
      ],
    );
  }
}
