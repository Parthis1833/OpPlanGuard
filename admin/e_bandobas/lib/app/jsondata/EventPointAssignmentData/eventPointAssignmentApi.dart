import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/Exceptions/DataNotFoundException.dart';
import 'package:e_bandobas/app/jsondata/EventPointAssignmentData/eventPointAssignmentModel.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

import 'eventAssignmentModel.dart';

class EventPointAssignmentModelApi {
  static Future<EventPointAssignmentModel> obtainEventPointAssignments(
      API_Decision showStatus, int eventId, int pointId) async {
    EventPointAssignmentModel model;
    Map modelApiData = {
      "event-id": eventId.toString(),
      "point-id": pointId.toString()
    };
    final response = await http.post(
        Uri.parse(APIConstants.ASSIGNPOLICE_POLICE_IN_POINT_AND_EVENT),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(modelApiData));
    print(response.body);
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "police force Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        model = EventPointAssignmentModel.fromJson(responseJson['content']);
        return model;
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'],
            icon: const Icon(Icons.cancel_presentation_sharp,
                color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    throw DataNotFoundException("Police assigned was not found from api")
        .errorSnackBar();
  }

  static Future<EventAssignmentModel?> obtainEventWiseAssignments(
      API_Decision showStatus, int eventId) async {
    EventAssignmentModel model;
    Map modelApiData = {
      "event-id": eventId.toString(),
    };
    final response =
        await http.post(Uri.parse(APIConstants.ASSIGNPOLICE_POLICE_IN_EVENT),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(modelApiData));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "police force Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        model = EventAssignmentModel.fromJson(responseJson['content']);
        return model;
      } // api error to be displayed
      else {
        print("why not");
        if (showStatus == API_Decision.Only_Failure ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'],
            icon: const Icon(Icons.cancel_presentation_sharp,
                color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
        return null;
      }
    }
    throw DataNotFoundException(
            "Police assigned was not found from api for event : $eventId")
        .errorSnackBar();
  }

  static obtainExcelFile(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    if (bytes.isEmpty) {
      throw DataNotFoundException("Downloaded file bytes not found from api ")
          .errorSnackBar();
    }
    return bytes;
  }
}
