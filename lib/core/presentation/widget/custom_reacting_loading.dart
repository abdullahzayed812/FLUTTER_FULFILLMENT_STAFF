import 'package:flutter/material.dart';

class CustomReactingLoading extends StatelessWidget {
  const CustomReactingLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width:15,
      height: 15,
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
      ),
    );
  }
}
