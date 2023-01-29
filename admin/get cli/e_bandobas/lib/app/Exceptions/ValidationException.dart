import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ValidationException {

  final validationSnackBar = Get.snackbar(
    "warning",
    "Some fields are required",
    icon: const Icon(Icons.pending, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.yellow,
  );
}

// final validationSnackBar = Get.snackbar(
//   "warning",
//   "Some fields are required",
//   icon: const Icon(Icons.pending, color: Colors.white),
//   snackPosition: SnackPosition.BOTTOM,
//   backgroundColor: Colors.yellow,
// );
