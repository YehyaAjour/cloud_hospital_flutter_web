import 'package:cloud_hospital/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../widgets/custom_text.dart';



class Helper {
  static setToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getSheetError(String title) {
    return Get.snackbar(
      '',
      '',
      messageText: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
           text: title,
            size: 16,
            weight: FontWeight.normal,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.info,
            color: Colors.red,
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
    );
  }

  static getSheetSucsses(String title) {
    return Get.snackbar(
      '',
      '',
      messageText: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
           text:title,
           size: 16,
            weight: FontWeight.normal,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
    );
  }

  static loading() {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          color: primaryColor,
        ),
      ],
    ));
  }

  static var appRaduis = BorderRadius.circular(8);
}
