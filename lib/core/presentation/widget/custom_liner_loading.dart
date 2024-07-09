import 'package:flutter/material.dart';
import 'package:postage_staff/core/core_packages.dart';

class CustomLinearLoading extends StatelessWidget {
  const CustomLinearLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const LinearProgressIndicator(
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
      ],
    );
  }
}
