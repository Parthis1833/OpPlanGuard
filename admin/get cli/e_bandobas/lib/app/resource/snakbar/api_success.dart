import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomGetx {
  static final ApiSuccess = Get.snackbar(
              "Success",
               "Hello everyone",
               icon: const Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.green,
               );
}