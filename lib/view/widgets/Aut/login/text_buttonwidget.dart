import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';

class TextButtonwidget extends StatelessWidget {
  const TextButtonwidget({
    super.key,
    required this.data,
    required this.text,
    required this.onTap,
  });

  final String data;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data,
            style: const TextStyle(
                color: ColorApp.lightMain,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: onTap,
            child: Text(text,
                style: const TextStyle(
                    color: ColorApp.mainApp,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
