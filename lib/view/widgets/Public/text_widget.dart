import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.data,
      required this.color,
      required this.fontWeight,
      required this.size});

  final String data;

  final Color color;

  final FontWeight fontWeight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
