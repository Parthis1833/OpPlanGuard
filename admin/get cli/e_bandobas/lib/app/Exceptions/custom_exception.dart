import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomException implements Exception {
  String? cause;

  CustomException(String s) {
    this.cause = s;
    // showValidationSnackBar();
  }

  final validationSnackBar = Get.snackbar(
    "warning",
    "Some fields are required",
    icon: const Icon(Icons.pending, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.yellow,
  );

  showValidationSnackBar() {
    Get.snackbar(
      "Warning",
      cause ?? "Some fields are missing",
      icon: const Icon(Icons.pending, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.yellow,
    );
  }

  showErrorSnackBar() {
    Get.snackbar(
      "Error",
      cause ?? "Some fields are have Error",
      icon: const Icon(Icons.pending, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }
}
