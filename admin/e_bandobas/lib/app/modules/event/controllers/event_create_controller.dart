import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCreateController extends GetxController {
  //TODO: Implement EventController

  final eventNameTextEditController = TextEditingController();
  final eventDetailsTextEditingController = TextEditingController();

  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;
  void saveEvent() async {
    bool result = false;
    if (eventNameTextEditController.text.isNotEmpty &&
        eventDetailsTextEditingController.text.isNotEmpty) {
      result = await EventApi.createEvent(
          API_Decision.BOTH,
          eventNameTextEditController.text,
          eventDetailsTextEditingController.text,
          startDate.value,
          endDate.value);
    } else {
      // validationSnackBar;
      ValidationException().showValidationSnackBar();
    }

    if (result) {
      eventDetailsTextEditingController.text = "";
      eventNameTextEditController.text = "";
    }

    update();
  }
  void chooseStartDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: startDate.value,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      helpText: 'Select event start date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Event Start Date',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != startDate.value) {
      startDate.value = pickedDate;
    }
  }

  void chooseEndDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: endDate.value,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      helpText: 'Select event end date',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Event end Date',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != endDate.value) {
      endDate.value = pickedDate;
    }
  }
}