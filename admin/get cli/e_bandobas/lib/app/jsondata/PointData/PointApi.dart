import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PointApi {
  static Future<List<Point>> obtainPoints(API_Decision showStatus) async {
    List<Point> points = <Point>[];
    final response = await http.get(
      Uri.parse(APIConstants.POINT_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success) {
          Get.snackbar(
            "Success",
            "Points Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          Point point = Point.fromJson(responseJson['content'][i]);
          points.add(point);
        }
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'],
            icon: Icon(Icons.cancel_presentation_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    return points;
  }

  static Future<bool> createPoint(
      API_Decision showStatus,
      String taluka,
      String district,
      String pointName,
      String accessories,
      String remarks,
      num? zone) async {
    // Point point = new Point();
    Map data = {
      'taluka': taluka,
      'district': district,
      'pointName': pointName,
      'accessories': accessories,
      'remarks': remarks,
      'zone': zone
    };

    final response = await http.post(Uri.parse(APIConstants.POINT_URL_CREATE),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success) {
          Get.snackbar(
            "Success",
            "Point Created successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        // TODO: we are not saving it in json format as we need it, will code it further
        // point = Point.fromJson(responseJson['content']);
        return true;
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
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
    return false;
  }

  static Future<List<Point>> obtainAssignedPolicePointsInEvent(API_Decision showStatus, num eventId) async {
    List<Point> points = <Point>[];
    final response = await http.get(
      Uri.parse("${APIConstants.POINT_POLICE_ASSIGNED_POINT}/$eventId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success) {
          Get.snackbar(
            "Success",
            "Points Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          Point point = Point.fromJson(responseJson['content'][i]);
          points.add(point);
        }
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'],
            icon: Icon(Icons.cancel_presentation_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    return points;
  }

}
