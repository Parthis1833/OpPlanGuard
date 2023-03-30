import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/Exceptions/DataNotFoundException.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../PoliceData/PoliceIdNameDesigNumbModel.dart';
import '../PoliceData/PoliceIdNameModel.dart';
import 'EventPoliceCountOfAssignedTotalRequestedModel.dart';

class EventPoliceCountAPI {
  // static Future<List<EventPoliceCountModel>> obtainA
  static Future<bool> createAssignment(
      API_Decision showStatus, Map modelApiData) async {
    final response =
        await http.post(Uri.parse(APIConstants.EVENT_POLICE_COUNT_CREATE),
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
            "Police Assignement noted for event successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
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

  static Future<List<PoliceIdName>> getUnAssignedPoliceList(
      API_Decision showStatus, num eventId) async {
    final response = await http.get(
      Uri.parse(APIConstants.EVENT_POLICE_COUNT_UNASSIGNED_POLICE_LIST +
          eventId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "Police obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        List<PoliceIdName> policeIdNameList = [];
        for (int i = 0; i < responseJson['content'].length; i++) {
          PoliceIdName police =
              PoliceIdName.fromJson(responseJson['content'][i]);
          policeIdNameList.add(police);
        }
        return policeIdNameList;
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
    throw DataNotFoundException(
        "Data not found from server api hit : event_police_count/unassigned_police_list$eventId");
  }

  static Future<List<PoliceIdNameDesigNumb>>
      getUnAssignedPoliceIdNameDesigNumbList(
          API_Decision showStatus, num eventId, String searchName) async {
    final modelApiData = {'event-id': eventId, 'search-police': searchName};

    final response = await http.post(
        Uri.parse(APIConstants
            .EVENT_POLICE_COUNT_UNASSIGNED_POLICE_ID_NAME_DESIG_NUMB_LIST),
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
            "Police obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        List<PoliceIdNameDesigNumb> policeIdNameDesigNumberList = [];
        for (int i = 0; i < responseJson['content'].length; i++) {
          PoliceIdNameDesigNumb police =
              PoliceIdNameDesigNumb.fromJson(responseJson['content'][i]);
          policeIdNameDesigNumberList.add(police);
        }
        return policeIdNameDesigNumberList;
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
    throw DataNotFoundException(
        "Data not found from server api hit : event_police_count/unassigned_police_list$eventId");
  }

  static Future<List<EventPoliceCountAssignedTotalRequestedModel>>
      obtainEventPoliceCountAssignments(
          API_Decision showStatus, int eventId) async {
    final response = await http.get(
      Uri.parse(APIConstants.EVENT_POLICE_COUNT_OF_POLICE_BY_DESIGNATION +
          eventId.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "Police Assigned Counts obtained for event successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        List<EventPoliceCountAssignedTotalRequestedModel> resp = [];
        if (responseJson['content'] != null) {
          for (int i = 0; i < responseJson['content'].length; i++) {
            EventPoliceCountAssignedTotalRequestedModel policeAssignment =
                EventPoliceCountAssignedTotalRequestedModel.fromJson(responseJson['content'][i]);
                resp.add(policeAssignment);
          }
        }
        return resp;
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
    return [];
  }
}
