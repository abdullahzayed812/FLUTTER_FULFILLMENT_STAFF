import 'package:flutter/material.dart';
import 'package:postage_staff/core/core_packages.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value *
          (Orientation.landscape == MediaQuery.orientationOf(context)
              ? context.height * 0.024
              : context.width * 0.024),
    );
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

    return SizedBox(
      height: value *
          (Orientation.landscape == MediaQuery.orientationOf(context)
              ? context.height * 0.024
              : context.width * 0.024),
    );
  }
}
