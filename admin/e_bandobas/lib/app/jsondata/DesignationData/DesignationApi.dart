import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DesignationApi {
  static Future<List<Designation>> obtainDesignations(
      API_Decision showStatus) async {
    List<Designation> designations = <Designation>[];
    final response = await http.get(
      Uri.parse(APIConstants.DESIGNATION_URL),
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
            "Designation Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          Designation designation =
              Designation.fromJson(responseJson['content'][i]);
          designations.add(designation);
        }
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
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
    return designations;
  }

  static updateDesignation(
      API_Decision showStatus, String? name, String? nameInGuj, num? id) async {
    final modelApiData = {
      "id": id,
      "name-in-english": name,
      "name-in-gujarati": nameInGuj
    };
    print(APIConstants.DESIGNATION_URL_UPDATE + id.toString());
    final response = await http.put(
        Uri.parse(APIConstants.DESIGNATION_URL_UPDATE + id.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(modelApiData));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success) {
          Get.snackbar(
            "Success",
            "Designation Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        return true;
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
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


  static deleteDesignation(
      API_Decision showStatus, num? id) async {
    
    print(APIConstants.DESIGNATION_URL_UPDATE + id.toString());
    final response = await http.delete(
        Uri.parse(APIConstants.DESIGNATION_URL_UPDATE + id.toString()),
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
            "Designation deleted successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        return true;
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
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
