
import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ZoneApi {
  static Future<List<Zone>> obtainZones(API_Decision showStatus) async {
    List<Zone> zones = <Zone>[];
    final response = await http.get(
      Uri.parse(APIConstants.ZONE_READ_ALL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success || showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "Zone Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          Zone zone = Zone.fromJson(responseJson['content'][i]);
          zones.add(zone);
        }
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure || showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'],
            icon: const Icon(Icons.cancel_presentation_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    return zones;
  }
  
}
