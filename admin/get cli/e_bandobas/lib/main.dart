import 'dart:io';
import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:convert';

void main() async {
  // String path = "/Users/apple/Desktop/projects/gujarat_police_backend/";
  // String path = "/Users/apple/Desktop/projects/gujarat_police_backend/";
  // await Process.run('curl', ['-X', 'POST', 'localhost:8080/actuator/shutdown'],
  //         workingDirectory: path)
  //     .then((ProcessResult results) {
  //   print(results.stdout);
  //   Process.run('git', ['checkout', 'development'], workingDirectory: path)
  //       .then((ProcessResult results) {
  //     Process.run('git', ['pull'], workingDirectory: path)
  //         .then((ProcessResult results) {
  //       Process.run('mvn', ['spring-boot:run'], workingDirectory: path)
  //           .then((ProcessResult results) {
  //         print(results.stdout);
  //         startApp();
  //       });
  //     });
  //   });
  // });
  // Process.run('curl', ['-X', 'POST', 'localhost:8080/actuator/shutdown'],
  //         workingDirectory: path)
  //     .then((ProcessResult results) {
  //       Process.run('java', ['-jar', 'target/gujarat-police-backend.jar'],
  //                 workingDirectory: path)
  //             .then((ProcessResult results) {
  //         print(results.stdout);

  //           startApp();
  //         });
  //     });

  startApp();
}

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WindowManager.instance.setFullScreen(true);
    WindowManager.instance
        .setMaximumSize(const Size(double.infinity, double.infinity));
    WindowManager.instance.setMinimumSize(const Size(1224, 768));
  }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Bandobas",
      // theme: ThemeData.light(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
