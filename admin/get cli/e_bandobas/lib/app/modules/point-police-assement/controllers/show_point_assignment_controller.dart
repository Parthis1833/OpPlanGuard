import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/DesignationApi.dart';
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
    update();
  }

  void loadPoints() async {
    print("done");
    points.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (points.value != null && points.value!.length > 0) {
      selectedPointId.value = points.value!.elementAt(0).id!.toInt();
    }

    print(points.value![0].zone);
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
    // designations.value =
    //     await DesignationApi.obtainDesignations(API_Decision.Only_Failure);
    // if (designations.value != null) {
    //   for (var i in designations.value!) {
    //     var textEditingController = TextEditingController(text: "");
    //     designationTextEditingControllers.add(textEditingController);
    //     // return textFields.add(new TextField(controller: textEditingController));
    //   }
    // }
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
    print(pointPoliceCountAssignment.value?.eventName ?? "");
    isPointPoliceCountAssigned.value = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
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
