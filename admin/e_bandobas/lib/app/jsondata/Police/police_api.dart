import 'package:e_bandobas/app/Api/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constants/enums.dart';
import '../PoliceData/police_model.dart';

class PoliceApi {
  static Future<String> insertPoliceUsingExcel(
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

  static Future<List<PoliceModel>> getPoliceInEvent(
      API_Decision showStatus, num eventId) async {
    List<PoliceModel> policeList = <PoliceModel>[];

    final response = await http.get(
      Uri.parse(APIConstants.POLICE_IN_EVENT + eventId.toString()),
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
            "Police Obtained successfully",
            icon: const Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          PoliceModel police = PoliceModel.fromJson(responseJson['content'][i]);
          policeList.add(police);
        }
        return policeList;
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
    return policeList;
  }

  Future<bool> deletePolice(API_Decision showStatus, num? id) async {
    final response = await http.delete(
      Uri.parse(APIConstants.POLICE_URL_DELETE + id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
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
        return true;
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
      return false;
    }
    return false;
  }

  static void updatePolice(
      API_Decision showStatus, PoliceModel contentList) async {
    final modelApiData = {
      "full-name": contentList.fullName,
      "buckle-number": contentList.buckleNumber,
      "number": contentList.number,
      "age": contentList.age,
      "district": contentList.district,
      "gender": contentList.gender,
      "designation-name": contentList.designationName,
    };
    final response = await http.put(
        Uri.parse(APIConstants.POLICE_URL_UPDATE + contentList.id.toString()),
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
            "Police deleted successfully",
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

  static Future<String> downloadSampleApi(API_Decision showStatus) async {
    final response = await http.get(
      Uri.parse(APIConstants.POLICE_SAMPLE_EXCEL),
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
