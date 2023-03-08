import 'package:e_bandobas/app/Exceptions/DataNotFoundException.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/EventPointAssignmentData/eventPointAssignmentApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:e_bandobas/utils/text_utils.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../../jsondata/EventPointAssignmentData/eventAssignmentModel.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:http/http.dart' as http;

class DutypointallocationController extends GetxController {
  late final selectedEventId = 0.obs;
  final events = Rxn<List<Event>>();
  final eventAssignmentModel = Rxn<EventAssignmentModel>();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  void increment() => count.value++;

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    update();
  }

  showAssignments() async {
    eventAssignmentModel.value =
        await EventPointAssignmentModelApi.obtainEventWiseAssignments(
            API_Decision.BOTH, selectedEventId.value);
    update();
  }

  // void downloadExcel() async {
  //   if (eventAssignmentModel.value != null &&
  //       eventAssignmentModel.value!.fileName!.length > 0) {
  //     final url = eventAssignmentModel.value!.fileName!;
  //     final bytes = EventPointAssignmentModelApi.obtainExcelFile(url);

  //     final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
  //     final filename = url.split('/').last;
  //     final file = File('${downloadsDirectory.path}/$filename');
  //     await file.writeAsBytes(bytes);
  //   } else {
  //     throw DataNotFoundException("Download file not found").errorSnackBar();
  //   }
  // }

  void downloadExcel() async {
    if (eventAssignmentModel.value != null &&
        eventAssignmentModel.value!.fileName!.length > 0) {
      // File file =
      //     await _getTemporaryDirectory(eventAssignmentModel.value!.fileName!);
      // file.exists().then((bool exists) {
      //   if (exists) {
      //     file.readAsBytes().then((bytes) {
      //       print("file exists");
      //       final blob = html.Blob([bytes], 'application/vnd.ms-excel');
      //       final url = html.Url.createObjectUrlFromBlob(blob);
      //       html.window.open(url, "_self");
      //     });
      //   }
      // });
      // final file = File(eventAssignmentModel.value!.fileName!);
      // final dir = await getApplicationDocumentsDirectory();
      // file.copy(dir.path);
      if (TextUtils.notBlankNotEmpty(eventAssignmentModel.value!.fileName)) {
        OpenFile.open(eventAssignmentModel.value!.fileName!);
      }
      // downloadFile(eventAssignmentModel.value!.fileName!);
      // processFile(eventAssignmentModel.value!.fileName!);

      print("file exists");
    } else {
      throw DataNotFoundException("Download file not found").errorSnackBar();
    }
  }
}
