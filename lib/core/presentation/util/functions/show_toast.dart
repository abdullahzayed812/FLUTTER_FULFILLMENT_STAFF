import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
        {required String msg,
        required ToastStates state,
        int? time,
        ToastGravity? position,}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: position ?? ToastGravity.BOTTOM,
        timeInSecForIosWeb: time ?? 6,
        // backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16,);

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

// Color chooseToastColor(ToastStates state) {
//   Color color;
//   switch (state) {
//     case ToastStates.SUCCESS:
//       color = Colors.green;
//     case ToastStates.ERROR:
//       color = Colors.red;
//     case ToastStates.WARNING:
//       color = context.color.primaryColor;
//   }
//   return color;
// }
