import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

void navigateToAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false,
    );

Widget defaultText({
  required String text,
  double fontSize = 16.0,
  Color color = textColor,
  String? fontFamily,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    ),
  );
}
