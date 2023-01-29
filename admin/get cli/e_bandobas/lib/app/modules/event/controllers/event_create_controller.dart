import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventCreateController extends GetxController {
  //TODO: Implement EventController

  final eventNameTextEditController = TextEditingController();
  final eventDetailsTextEditingController = TextEditingController();

  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

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
      print(result);
    } else {
      // validationSnackBar;
      ValidationException().validationSnackBar;
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
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
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
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
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

// now creating ui of 

// assignedPolice in points.

// UI parts:

// 1. 