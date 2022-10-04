import 'package:e_bandobas1/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}