
import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'PoliceStationModel.dart';
import 'package:flutter/services.dart';

class PoliceStationApi {
  static Future<List<PoliceStationModel>> obtainPoliceStationModel(API_Decision showStatus) async {
    List<PoliceStationModel> policeStations = <PoliceStationModel>[];
    final response = await http.get(
      Uri.parse(APIConstants.POLICESTATION_URL),
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
            "police stations Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          PoliceStationModel policeStation = PoliceStationModel.fromJson(responseJson['content'][i]);
          policeStations.add(policeStation);
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
    return policeStations;
  }
  
  static Future<String> insertPoliceStationUsingExcel(
      API_Decision showStatus,
      Uint8List? policeStationFile,
      String fileName,
      ) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(APIConstants.POLICESTATION_URL_UPLOAD_FROM_EXCEL),
    );
    request.files.add(
        http.MultipartFile.fromBytes('file', policeStationFile!, filename: fileName));
    // request.files
    //     .add(await http.MultipartFile.fromPath('file', policeFile.path));
    final response = await http.Response.fromStream(await request.send());
    print(request.url);
    print(request.fields);
    print(request.files);
    print(request.headers);

    print(response.body);
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Success",
            "Police Inserted successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        return responseJson['response']['message'];
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'] ?? "no message from server",
            icon: const Icon(Icons.cancel_presentation_sharp,
                color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    return "";
  }

  static downloadSampleApi(API_Decision showStatus) async {
    final response = await http.get(
      Uri.parse(APIConstants.POLICESTATION_SAMPLE_EXCEL),
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
            "Police deleted successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        return responseJson['response']['message'];
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure ||
            showStatus == API_Decision.BOTH) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'] ?? "no message from server",
            icon: const Icon(Icons.cancel_presentation_sharp,
                color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    return "";
  }
}
