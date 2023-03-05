import 'package:get/get.dart';

import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/Event.dart';
import '../../../jsondata/EventData/EventApi.dart';
import 'package:file_picker/file_picker.dart';

class PoliceCreateController extends GetxController {
  late final selectedEventId = 0.obs;
  final events = Rxn<List<Event>>();
  final policeFile = Rxn<FilePickerResult>();

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
if (policeFile.value != null ||
        TextUtils.notBlankNotEmpty(password.value)) {
      final fileBytes = policeFile.value!.files.single.bytes;
      filename = policeFile.value!.files.single.name;
      if (fileBytes == null) {
        throw CustomException("Error reading data").validationSnackBar;
      }

      PoliceApi.insertPoliceUsingExcel(API_Decision.BOTH, selectedEventId.value, fileBytes,
          filename, username, phoneNumber, "0", password.value);
      
    } else {
      throw ValidationException("Some Fields are required to upload ")
          .showValidationSnackBar();
    }
    update();
  }
}
