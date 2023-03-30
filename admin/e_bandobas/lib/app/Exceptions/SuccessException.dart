import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessException implements Exception {
  String cause;
  SuccessException(this.cause);

  successSnackBar() {
    Get.snackbar(
    "Success",
    cause.toString(),
    icon: const Icon(Icons.pending, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.lightGreenAccent,
  );
  }
}
