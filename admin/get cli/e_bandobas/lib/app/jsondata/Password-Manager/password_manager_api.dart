import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/Exceptions/DataNotFoundException.dart';
import 'package:e_bandobas/app/Exceptions/SuccessException.dart';
import 'package:e_bandobas/app/jsondata/Password-Manager/password_history_model.dart';
import 'package:e_bandobas/app/jsondata/ZoneData/Zone.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PassworManegerAPI {
  static Future<String> createPasswordFromApi(
      API_Decision showStatus, int eventId) async {
    final modelApiData = {
      "event-id": eventId,
    };
    final response =
        await http.post(Uri.parse(APIConstants.PASSWORD_MANAGER_CREATE),
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
            "password Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        // throw SuccessException(
        //     "Password : " + responseJson['response']['message']).successSnackBar();
        return responseJson['response']['message'];
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
    throw new DataNotFoundException(
        "could not create password, please try again later.");
  }

  static Future<PasswordHistoriesModel> getPasswordHistories(
      API_Decision showStatus) async {
    final response = await http.get(
      Uri.parse(APIConstants.PASSWORD_MANAGER_HISTORY),
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
            "password histories Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        return PasswordHistoriesModel.fromJson(responseJson['content']);
        // return responseJson['response']['message'];
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
    throw new DataNotFoundException(
        "could not create password, please try again later.");
  }
}
