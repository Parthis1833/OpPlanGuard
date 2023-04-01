import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../API/API.dart';
import '../../Constants/enums.dart';

class PoliceApi {
  static void insertPoliceUsingExcel(
      API_Decision showStatus,
      int eventId,
      Uint8List? policeFile,
      String fileName,
      String userName,
      String phoneNumber,
      String accessType,
      String password) async {

    final Map<String, String> modelApiData = {
      'event-id': eventId.toString(),
      'username': userName,
      'phone-number': phoneNumber,
      'access-type': accessType,
      'password': password
    };
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(APIConstants.POLICE_URL_UPLOAD_FROM_EXCEL),
    );
    request.headers.addAll(modelApiData);
    request.fields['event-id'] = eventId.toString();
    request.files.add(
        http.MultipartFile.fromBytes('file', policeFile!, filename: fileName));
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
  }
}
