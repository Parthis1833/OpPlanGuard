import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/DesignationApi.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPoliceCountOfAssignedTotalRequestedModel.dart';
import 'package:e_bandobas/app/jsondata/PointData/PointApi.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:e_bandobas/app/jsondata/PointPoliceCount/PointPoliceCountApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var designationTextEditingControllers = <TextEditingController>[];
  late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final designations = Rxn<List<Designation>>();
  final events = Rxn<List<Event>>();
  final points = Rxn<List<Point>>();
  final eventAssignmentCounts = Rxn<List<EventPoliceCountAssignedTotalRequestedModel>>();

  void getEventAssignments() async {
    eventAssignmentCounts.value =
    await EventPoliceCountAPI.obtainEventPoliceCountAssignments(
        API_Decision.Only_Failure, selectedEventId.value);
  }

  void loadDesignations() async {
    designations.value =
        await DesignationApi.obtainDesignations(API_Decision.Only_Failure);
    if (designations.value != null) {
      for (var i in designations.value!) {
        var textEditingController = TextEditingController(text: "");
        designationTextEditingControllers.add(textEditingController);
      }
    }
    update();
  }

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length >= 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }

  void loadPoints() async {
    points.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (points.value != null && points.value!.length >= 0) {
      selectedPointId.value = points.value!.elementAt(0).id!.toInt();
    }

    update();
  }

  void savePointAssignment() async {
    Map<String, String> designationsData = {};
    for (int i = 0; i < designations.value!.length; i++) {
      if (designationTextEditingControllers[i].text.isNotEmpty &&
          int.parse(designationTextEditingControllers[i].text) > 0) {
        designationsData[designations.value![i].id.toString()] =
            designationTextEditingControllers[i].text;
      }
    }
    Map eventPoliceCountData = {
      "event-id": selectedEventId.value,
      "point-id": selectedPointId.value,
      "designations": designationsData,
    };

    if (designationsData.isEmpty) {
      throw ValidationException().validationSnackBar;
    }

    bool result = await PointPoliceCountApi.createAssignment(
        API_Decision.BOTH, eventPoliceCountData);

    for (int i = 0; i < designationTextEditingControllers.length; i++) {
      designationTextEditingControllers[i].clear();
    }
    update();
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    update();
  }

  void changeSelectedPoint(num? value) {
    selectedPointId.value = value!.toInt();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadDesignations();
    loadEvents();
    loadPoints();
  }
}
