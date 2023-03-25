import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/resource/poppage/password_popup.dart';
import 'package:e_bandobas/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/EventApi.dart';
import '../../../jsondata/Password-Manager/password_history_model.dart';
import '../../../jsondata/Password-Manager/password_manager_api.dart';

class SettingController extends GetxController {
  late final selectedEventId = 0.obs;
  final darkTheme = false.obs;

  final events = Rxn<List<Event>>();
  final passwordHistories = Rxn<PasswordHistoriesModel>();

  @override
  void onInit() {
    super.onInit();
    loadEvents();
    loadPasswordHistories();
  }

  @override
  void onReady() {
    super.onReady();
    print("working 2");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadEvents() async {
    events.value = (await EventApi.obtainEvents(API_Decision.Only_Failure));
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
      String password = await PassworManegerAPI.createPasswordFromApi(
          API_Decision.Only_Failure, selectedEventId.value);
      if (TextUtils.notBlankNotEmpty(password)) {
        passwordPopup(
            events.value!
                    .where((element) => element.id == selectedEventId.value)
                    .first
                    .eventName ??
                "",
            password);
      }
    } else {
      throw ValidationException(cause: "Some Fields are required")
          .showValidationSnackBar();
    }
  }

  void loadPasswordHistories() async {
    passwordHistories.value =
        await PassworManegerAPI.getPasswordHistories(API_Decision.BOTH);
    update();
  }

  void toggleTheme() {
    Get.changeTheme(!darkTheme.value ? ThemeData.light() : ThemeData.dark());
    darkTheme.value = !darkTheme.value;
    update();
  }
}
