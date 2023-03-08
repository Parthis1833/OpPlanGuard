import 'dart:io';
import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WindowManager.instance.setFullScreen(true);
    WindowManager.instance.setMaximumSize(const Size(double.infinity, double.infinity));
    WindowManager.instance.setMinimumSize(const Size(1224, 768));
  }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Bandobas",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
