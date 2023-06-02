// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final List<Shadow> shadow;
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  const CustomText({
    Key? key,
    required this.shadow,
    required this.text,
    required this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadow,
      ),
    );
  }
}
