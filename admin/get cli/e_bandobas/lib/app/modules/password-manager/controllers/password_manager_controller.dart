import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:get/get.dart';

import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/EventApi.dart';
import '../../../jsondata/Password-Manager/password_manager_api.dart';

class PasswordManagerController extends GetxController {
  late final selectedEventId = 0.obs;
  final events = Rxn<List<Event>>();

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
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    update();
  }

  void createPassword() async {
    if (selectedEventId.value != 0) {
      await PassworManegerAPI.createPasswordFromApi(
          API_Decision.BOTH, selectedEventId.value);
    } else {
      throw ValidationException(cause: "Some Fields are required")
          .validationSnackBar;
    }
  }
}
