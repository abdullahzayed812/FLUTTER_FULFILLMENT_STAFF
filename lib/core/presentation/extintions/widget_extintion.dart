import 'package:flutter/material.dart';

extension ExtendedText on Widget {
  Align alignAtStart() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: this,
    );
  }
  Align alignAtCenter() {
    return Align(
      alignment: AlignmentDirectional.center,
      child: this,
    );
  }

  Align alignAtEnd() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: this,
    );
  }
  Container addContainer(){
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.yellow,
      child: this,
    );
  }
}
