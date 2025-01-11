import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/constant/theme.dart';


class Feattures {
  static Future<bool>alertExit() {
     Get.defaultDialog(
      title: 'Alert',
      middleText: 'Do you want to exit app ',
      backgroundColor: ColorApp.darkMain,actions: [
      InkWell(
        splashColor: ColorApp.darkMain.withOpacity(0.1),
        onTap: () {
          exit(0) ;
        },
        child: Container(
          width: 163,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorApp.darkMain,
          ),
          child: const Center(
            child: Text(
              'YES',
              style: TextStyle(
                  color: ColorApp.mainApp,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
      InkWell(
        splashColor: ColorApp.darkMain.withOpacity(0.1),
        onTap: () {
          Get.back() ;
        },
        child: Container(
          width: 163,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorApp.darkMain,
          ),
          child: const Center(
            child: Text(
              'YES',
              style: TextStyle(
                  color: ColorApp.mainApp,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      )

    ]
    );
    return Future.value(true);
  }

  static validator(String value, String tape) {
    if (tape == 'userName') {
      if (!GetUtils.isUsername(value)) {
        return 'not valid for name';
      }
    }
    if (tape == 'phoneNumber') {
      if (!GetUtils.isPhoneNumber(value)) {
        return 'not valid for phone number';
      }
    }
    if (tape == 'Password') {
      if (value.length < 8 || value.length > 12) {
        return 'the password is short or more long';
      }
    }
    if (tape == 'location') {
      if (value.isEmpty) {
        return 'the location is required';
      }
    }
  }
}
