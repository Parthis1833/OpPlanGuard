import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/Exceptions/DataNotFoundException.dart';
import 'package:e_bandobas/app/jsondata/EventPointAssignmentData/eventPointAssignmentModel.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "police force Obtained successfully",
            icon: Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }

        model = EventPointAssignmentModel.fromJson(responseJson['content']);
        print(responseJson['content']);
        print(model.eventId);
        print(model.pointId);
        print(model.assignedPoliceList?.length);
        return model;
        // for (int i = 0; i < responseJson['content'].length; i++) {
        //   Zone zone = Zone.fromJson(responseJson['content'][i]);
        //   zones.add(zone);
        // }
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure ||
            showStatus == API_Decision.BOTH) {
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
    print(response.body);
    throw DataNotFoundException("Police assigned was not found from api")
        .errorSnackBar();
  }
}
