import 'dart:io';

import 'package:e_bandobas/app/jsondata/Police/police_api.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../constants/enums.dart';
import '../../../../utils/text_utils.dart';
import '../../../Exceptions/ValidationException.dart';
import '../../../Exceptions/custom_exception.dart';
import '../../../jsondata/EventData/Event.dart';
import '../../../jsondata/EventData/EventApi.dart';
import 'package:file_picker/file_picker.dart';

class PoliceCreateController extends GetxController {
  late final selectedEventId = 0.obs;
  final events = Rxn<List<Event>>();
  final policeFile = Rxn<FilePickerResult>();
  String filename = "";
  final password = "".obs;

  @override
  void onInit() {
    super.onInit();
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

  void pickAndUploadFile() async {
    policeFile.value = await FilePicker.platform.pickFiles(withData: true);
    if (policeFile.value != null) {
      final fileBytes = policeFile.value!.files.single.bytes;
      filename = policeFile.value!.files.single.name;
      if (fileBytes == null) {
        throw CustomException("Error reading data").validationSnackBar;
      }

      String outputFileLocation = await PoliceApi.insertPoliceUsingExcel(
          API_Decision.BOTH,
          selectedEventId.value,
          fileBytes,
          filename,
          "ADMIN",
          "9090909090",
          "0",
          password.value);

      // final file = File(outputFileLocation);
      // final dir = await getApplicationDocumentsDirectory();
      // file.copy(dir.path);
      if (TextUtils.notBlankNotEmpty(outputFileLocation)) {
        OpenFile.open(outputFileLocation);
      }
    } else {
      throw ValidationException(cause: "Some Fields are required to upload ")
          .showValidationSnackBar();
    }
    update();
  }

  passwordUpdated(String text) {
    password.value = text;
    update();
  }

  void downloadPoliceSampleFile() async {
    String sampleExcelFileLocation =
        await PoliceApi.downloadSampleApi(API_Decision.Only_Failure);
    if (TextUtils.notBlankNotEmpty(sampleExcelFileLocation)) {
        OpenFile.open(sampleExcelFileLocation);
    } else {
      throw ValidationException(cause: "Sorry, download file not available")
          .showValidationSnackBar();
    }
  }
}
