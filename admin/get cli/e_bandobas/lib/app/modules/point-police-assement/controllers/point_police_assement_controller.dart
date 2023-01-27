import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/DesignationApi.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPolceCountModel.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:e_bandobas/app/jsondata/PointData/PointApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointPoliceAssementController extends GetxController {
  //TODO: Implement PointPoliceAssementController

  var designationTextEditingControllers = <TextEditingController>[];
  late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final designations = Rxn<List<Designation>>();
  final events = Rxn<List<Event>>();
  final points = Rxn<List<Point>>();

  void loadDesignations() async {
    designations.value =
        await DesignationApi.obtainDesignations(API_Decision.Only_Failure);
    if (designations.value != null) {
      for (var i in designations.value!) {
        var textEditingController = TextEditingController(text: "");
        designationTextEditingControllers.add(textEditingController);
        // return textFields.add(new TextField(controller: textEditingController));
      }
    }
    update();
  }

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }

  void loadPoints() async {
    points.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (points.value != null && points.value!.length > 0) {
      selectedPointId.value = points.value!.elementAt(0).id!.toInt();
    }
    print(points.value![0].pointName);
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
    print(eventPoliceCountData);
    EventPoliceCountModel e = EventPoliceCountModel(
        eventId: selectedEventId.value, designations: designationsData);

    bool result = await EventPoliceCountAPI.createAssignment(
        API_Decision.BOTH, eventPoliceCountData);
    print(result);

    // print()
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}