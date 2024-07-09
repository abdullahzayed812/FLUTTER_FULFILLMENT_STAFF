import 'package:flutter/material.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';

// import '../../utiles/app_colors.dart';

Future<dynamic> customBottomSheet({
  required BuildContext context,
  required String text,
  required IconData icon,
  required GestureTapCallback onTap,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextApp(text),
            const SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              color: Colors.red,
            ),
          ],
        ),
      ),
    ),
  );
}
