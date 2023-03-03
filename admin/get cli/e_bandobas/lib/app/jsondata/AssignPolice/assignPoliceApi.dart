import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' show utf8;

class AssignPoliceApi {
  static Future<bool> assignMultiplePoliceManually(
      API_Decision showStatus,
      List<num?> policeIds,
      num pointId,
      num eventId,
      DateTime eventStartDate,
      DateTime eventEndDate) async {
    final modelApiData = {
      'police-ids': policeIds,
      'point-id': pointId,
      'event-id': eventId,
      'duty-start-date':
          DateFormat("dd/MM/yyyy").format(eventStartDate).toString(),
      'duty-end-date': DateFormat("dd/MM/yyyy").format(eventEndDate).toString()
    };

    final response = await http.post(
        Uri.parse(APIConstants.ASSIGNPOLICE_URL_ASSIGN_MULTIPLE),
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
            responseJson['response']['message'] ?? "",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        return true;
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
        return false;
      }
    }
    return false;
  }
}
