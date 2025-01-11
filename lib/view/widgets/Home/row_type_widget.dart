import 'package:flutter/material.dart';
import 'package:prl_app/model/constant/theme.dart';

import '../Public/text_widget.dart';

class RowTypeWidget extends StatelessWidget {
  const RowTypeWidget({
    super.key,
    required this.data,
    required this.onTap, required this.container, required this.text,
  });
  final Color container;
  final Color text ;
  final String data;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorApp.darkMain.withOpacity(0.1),
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: container,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: TextWidget(
                data: data,
                color: text,
                fontWeight: FontWeight.w400,
                size: 14)),
      ),
    );
  }
}
