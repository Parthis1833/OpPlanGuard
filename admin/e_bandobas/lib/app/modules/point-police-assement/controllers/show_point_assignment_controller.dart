import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/PointData/PointApi.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:e_bandobas/app/jsondata/PointPoliceCount/PointPoliceCountApi.dart';
import 'package:e_bandobas/app/jsondata/PointPoliceCount/PointPoliceCountAssignmentModel.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPointPoliceAssementController extends GetxController {
  //TODO: Implement PointPoliceAssementController
  var designationTextEditingControllers = <TextEditingController>[];
  late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final events = Rxn<List<Event>>();
  final points = Rxn<List<Point>>();

  final pointPoliceCountAssignment = Rxn<PointPoliceCountAssignment>();

  // flag variables
  var isPointPoliceCountAssigned = false.obs;

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    loadPoints();
    update();
  }

  void loadPoints() async {
    points.value = await PointApi.obtainAssignedPolicePointsInEvent(
        API_Decision.Only_Failure, selectedEventId.value);
    if (points.value != null && points.value!.length >= 0) {
      selectedPointId.value = points.value!.  elementAt(0).id!.toInt();
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

  void loadPointPoliceAssignmentData() async {
    pointPoliceCountAssignment.value =
        await PointPoliceCountApi.obtainPointPoliceAssignments(
            API_Decision.BOTH, selectedEventId.value, selectedPointId.value);
    if (pointPoliceCountAssignment.value?.assignments != null) {
      for (var i in pointPoliceCountAssignment.value!.assignments!) {
        var textEditingController = TextEditingController(
          text: i.designationCount.toString(),
        );
        designationTextEditingControllers.add(textEditingController);
      }
    }

    isPointPoliceCountAssigned.value =
        pointPoliceCountAssignment.value?.assignments?.length != 0;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadEvents();
    loadPoints();
  }
}
