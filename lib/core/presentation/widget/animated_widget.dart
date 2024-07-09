// AnimatedContainer buildOptions({
//   required int index,
// }) {

// }

import 'package:flutter/material.dart';
import 'package:postage_staff/core/core_packages.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';

class AnimatedCardWidget extends StatefulWidget {
  const AnimatedCardWidget({
    required this.titles,
    required this.index,
    required this.currentIndex,
    required this.containerColor,
    required this.textColor,
    super.key,
    this.onTap,
  });

  final List<String> titles;
  final int index;
  final int currentIndex;

  final void Function()? onTap;
  final Color containerColor;
  final Color textColor;

  @override
  State<AnimatedCardWidget> createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: widget.onTap,
        //  () {
        // setState(() {
        // widget.currentIndex = widget.index;
        // });
        // },
        child: Container(
          width: context.width * 0.458,
          height: context.height * 0.07,
          decoration: BoxDecoration(
            color: widget.containerColor,
            // currentIndex == widget.index
            //     ? context.color.primaryColor
            //     : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: TextApp(
              widget.titles[widget.index],
              style: context.textStyle.copyWith(
                fontSize: 16,
                color: widget.textColor,
                // currentIndex == widget.index
                //     ? Colors.white
                //     : Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
