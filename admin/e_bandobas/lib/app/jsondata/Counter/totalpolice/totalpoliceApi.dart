import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/Counter/totalpolice/totalpolice.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;
import 'dart:convert';

class TotalpoliceApi {
  static Future<List<Totalpolice>> obtainTotalpolice(
      API_Decision showStatus) async {
    List<Totalpolice> TotalPolices = <Totalpolice>[];
    final response = await http.get(
      Uri.parse(APIConstants.EVENT_POLICE_COUNT_OF_POLICE_BY_DESIGNATION ),
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
            icon: Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          Totalpolice totalpolices =
          Totalpolice.fromJson(responseJson['content'][i]);
          TotalPolices.add(totalpolices);
        }
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
    return TotalPolices;
  }
}
