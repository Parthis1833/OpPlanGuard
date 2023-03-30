import 'package:flutter/material.dart';
import 'package:get/get.dart';

passwordPopup(String title, String password) => Get.defaultDialog(
    title: "OTP for $title",
    titleStyle: const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectableText(
          password,
          style: const TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: Get.back,
          child: const Text("ok"),
        )
      ],
    ));
