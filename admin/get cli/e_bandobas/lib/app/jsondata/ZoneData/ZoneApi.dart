import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ZoneApi {
  static Future<List<Zone>> obtainZones() async {
    List<Zone> zones = <Zone>[];
    final response = await http.get(
      Uri.parse('http://localhost:8080/zone/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      if (responseJson['response']['error'] == 0) {
        print(responseJson['content']);
        Get.snackbar(
          "Success",
          "Zone Obtained successfully",
          icon: Icon(Icons.add_task_sharp, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
        List<Zone> zones2 =
            responseJson['content'].map((data) => Zone.fromJson(data)).toList();

        return zones2;
      } // api error to be displayed
      else {
        Get.snackbar(
          "Failed",
          responseJson['response']['message'],
          icon: Icon(Icons.cancel_presentation_sharp, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
    }
    return zones;
  }
}
