import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/Exceptions/DataNotFoundException.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPolceCountModel.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'PointPoliceCountAssignmentModel.dart';

class PointPoliceCountApi {
  // static Future<List<EventPoliceCountModel>> obtainA
  static Future<bool> createAssignment(
      API_Decision showStatus, Map modelApiData) async {
        
    print(modelApiData);
    final response =
        await http.post(Uri.parse(APIConstants.POINT_POLICE_COUNT_CREATE),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(modelApiData));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "Police Assignement noted for point successfully",
            icon: Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        // TODO: we are not saving it in json format as we need it, will code it further
        return true;
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'] ?? "No message available",
            icon: const Icon(Icons.cancel_presentation_sharp,
                color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    return false;
  }

  static Future<PointPoliceCountAssignment> obtainPointPoliceAssignments(
      API_Decision showStatus, num? eventId, num? pointId) async {
    int obtainedEventId, obtainedPointId;
    String eventName;
    List<Assignment> assignments = [];
    final modelApiData = {
      'event-id': eventId,
      'point-id': pointId,
    };

    final response = await http.post(
        Uri.parse(APIConstants.POINT_POLICE_COUNT_DESIGNATION_COUNTS),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(modelApiData));

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "Police Assignement noted for point successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        // api data to model conversion
        obtainedEventId = responseJson['content']['event-id'];
        obtainedPointId = responseJson['content']['point-id'];
        eventName = responseJson['content']['event-name'];
        for (int i = 0;
            i < responseJson['content']['assignments'].length;
            i++) {
          Assignment assignment =
              Assignment.fromJson(responseJson['content']['assignments'][i]);
          assignments.add(assignment);
        }
        PointPoliceCountAssignment ppca = PointPoliceCountAssignment(
            pointId: obtainedPointId,
            eventId: obtainedEventId,
            eventName: eventName,
            assignments: assignments);
        return ppca;
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'] ?? "No message available",
            icon: const Icon(Icons.cancel_presentation_sharp,
                color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    throw DataNotFoundException("Data not found for pointPoliceAssignment");
  }
}
