import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';

import '../../../../constants/enums.dart';
import '../../../../utils/text_utils.dart';
import '../../../Exceptions/ValidationException.dart';
import '../../../Exceptions/custom_exception.dart';
import '../../../jsondata/PoliceStation/police_station_api.dart';

class PoliceStationCreateController extends GetxController {
  
  final policeStationFile = Rxn<FilePickerResult>();
  String filename = "";

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> pickAndUploadFile() async {
    policeStationFile.value = await FilePicker.platform.pickFiles(withData: true);
    if (policeStationFile.value != null) {
      final fileBytes = policeStationFile.value!.files.single.bytes;
      filename = policeStationFile.value!.files.single.name;
      if (fileBytes == null) {
        throw CustomException("Error reading data").validationSnackBar;
      }

      String outputFileLocation = await PoliceStationApi.insertPoliceStationUsingExcel(
          API_Decision.BOTH,
          fileBytes,
          filename,
          );

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

  void downloadPoliceStationSampleFile() async {
    String sampleExcelFileLocation =
        await PoliceStationApi.downloadSampleApi(API_Decision.Only_Failure);
    if (TextUtils.notBlankNotEmpty(sampleExcelFileLocation)) {
        OpenFile.open(sampleExcelFileLocation);
    } else {
      throw ValidationException(cause: "Sorry, download file not available")
          .showValidationSnackBar();
    }
  }
}
