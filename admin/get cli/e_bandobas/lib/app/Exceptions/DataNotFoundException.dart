import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataNotFoundException implements Exception {
  String cause;
  DataNotFoundException(this.cause);

  errorSnackBar() {
    Get.snackbar(
    "Error",
    cause.toString(),
    icon: const Icon(Icons.pending, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
  );
  }
}
