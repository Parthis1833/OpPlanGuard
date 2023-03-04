import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/DesignationApi.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPolceCountModel.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssesmentCreateController extends GetxController {

  var designationTextEditingControllers = <TextEditingController>[];
  late final selectedEventId = 0.obs;
  final designations = Rxn<List<Designation>>();
  final events = Rxn<List<Event>>();

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
    if (events.value != null && events.value!.isNotEmpty) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    print(events.value);
    update();
  }

  void saveEventAssignment() async {
    Map<String, String> designationsData = {};

    for (int i = 0; i < designations.value!.length; i++) {
      if (designationTextEditingControllers[i].text.isNotEmpty &&
          int.parse(designationTextEditingControllers[i].text) > 0) {
        designationsData[designations.value![i].id.toString()] = designationTextEditingControllers[i].text;
      }
    }
    Map eventPoliceCountData = {
      "event-id": selectedEventId.value,
      "designations": designationsData
    };
    EventPoliceCountModel e = EventPoliceCountModel(eventId: selectedEventId.value, designations: designationsData);
    bool result = await EventPoliceCountAPI.createAssignment(
        API_Decision.BOTH, eventPoliceCountData);
  }
  @override
  void onInit() {
    super.onInit();
    loadDesignations();
    loadEvents();
  }
  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    update();
  }
}
