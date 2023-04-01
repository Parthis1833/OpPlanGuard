import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:file_picker/file_picker.dart';
import 'package:gujarat_police_client_side/app/Exceptions/CustomException.dart';
import 'package:gujarat_police_client_side/app/Exceptions/ValidationException.dart';
import 'package:gujarat_police_client_side/app/jsonData/Police/police_apis.dart';

import '../../../../util/TextUtils.dart';
import '../../../Constants/enums.dart';
import '../../../jsonData/Event/event_api.dart';
import '../../../jsonData/Event/event_model.dart';

class PoliceInsertController extends GetxController {
  //TODO: Implement PoliceInsertController
  final policeFile = Rxn<FilePickerResult>();
  late final selectedEventId = 0.obs;
  final events = Rxn<List<Event>>();
  dynamic argumentData = Get.arguments;

  // final policeExcelFile = Rxn<File>();
  String filename = "";

  // final user = GetStorage();
  // String? get policeName => LocalStorage.getUserName();
  // String? get policeNumber => LocalStorage.getPhoneNumber();
  late final String username;
  late final String phoneNumber;
  final password = "".obs;

  @override
  void onInit() {
    super.onInit();
    // print(policeName.toString() + policeNumber.toString());
    // if (!TextUtils.notBlankNotEmpty(policeName) ||
    //     !TextUtils.notBlankNotEmpty(policeNumber)) {
    //   Get.toNamed(Routes.USER_DETAIL);
    // }
    username = argumentData['username'];
    phoneNumber = argumentData['phone-number'];
    print(username + " " + phoneNumber);
    loadEvents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void pickFile() async {
  //   policeFile.value = await FilePicker.platform.pickFiles();

  //   if (policeFile != null) {
  //     policeExcelFile.value = File(policeFile.value!.files.first);
  //     Uint8List? uploadfile = policeFile.value!.files.single.bytes;
  //     filename = basename(policeFile.value!.files.single.name);
  //   } else {
  //     throw ValidationException("Some Fields are required to upload ")
  //         .showValidationSnackBar();
  //   }
  //   update();
  // }

  Future<void> pickAndUploadFile() async {
    policeFile.value = await FilePicker.platform.pickFiles(withData: true);

    if (policeFile.value != null ||
        TextUtils.notBlankNotEmpty(password.value)) {
      //     policeExcelFile.value = File(policeFile.value!.files.first);
      //     Uint8List? uploadfile = policeFile.value!.files.single.bytes;
      //     filename = basename(policeFile.value!.files.single.name);
      //   } else {
      //     throw ValidationException("Some Fields are required to upload ")
      //         .showValidationSnackBar();
      //   }

      final fileBytes = policeFile.value!.files.single.bytes;
      filename = policeFile.value!.files.single.name;
      if (fileBytes == null) {
        throw CustomException("Error reading data").validationSnackBar;
      }

      // final url = Uri.parse('http://your-upload-endpoint.com');
      // final request = http.MultipartRequest('POST', url);

      PoliceApi.insertPoliceUsingExcel(API_Decision.BOTH, selectedEventId.value, fileBytes,
          filename, username, phoneNumber, "0", password.value);
      // request.files.add(http.MultipartFile.fromBytes(
      //   'file',
      //   fileBytes!,
      //   filename: fileName,
      // ));

      // final response = await request.send();

      // if (response.statusCode == 200) {
      //   print('File uploaded successfully!');
      // } else {
      //   print('File upload failed.');
      // }
    } else {
      throw ValidationException("Some Fields are required to upload ")
          .showValidationSnackBar();
    }
    update();
  }

  passwordUpdated(String text) {
    password.value = text;
    update();
  }

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.isNotEmpty) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    print(events.value);
    update();
  }
    void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    update();
  }

}
