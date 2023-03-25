import 'dart:io';
import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:convert';

void main() async {
  const path = "/mnt/3C34684F34680E68/GP-Police/gujarat_police_backend";
  try {
    await shutDownServer(path);
    await gitCheckout(path);
    await gitPull(path);
    await runSpringBoot(path);
    startApp();
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> shutDownServer(String path) async {
  final processResult = await Process.run(
    'curl',
    ['-X', 'POST', 'localhost:8080/actuator/shutdown'],
    workingDirectory: path,
  );
  print(processResult.stdout);
}

Future<void> gitCheckout(String path) async {
  final processResult = await Process.run(
    'git',
    ['checkout', 'development'],
    workingDirectory: path,
  );
  print(processResult.stdout);
}

Future<void> gitPull(String path) async {
  final processResult = await Process.run(
    'git',
    ['pull'],
    workingDirectory: path,
  );
  print(processResult.stdout);
}

Future<void> runSpringBoot(String path) async {
  final processResult = await Process.run(
    'mvn',
    ['spring-boot:run'],
    workingDirectory: path,
  );
  print(processResult.stdout);
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
