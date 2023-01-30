import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/assigned_police_controller.dart';

class AssignedPoliceView extends GetView<AssignedPoliceController> {
  const AssignedPoliceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssignedPoliceView'),
        centerTitle: true,
      ),
      body: Obx(() => ( controller.events.value == null && controller.points.value == null )
      ? const CircularProgressIndicator() 
      : assesmentDataWidget())
    );
  }

  Widget assesmentDataWidget() {
    return ListView(
      children: [
        Row(
          children: [
            eventSelectionDropDownWidget(),
            pointSelectionDropDownWidget(),
            showAssignmentButton(),
          ],
        ),
        controller.isAssignmentLoaded.value 
        ? Container(
          child: Column(
            children: [
              Text(controller.eventPointAssignmentModel.value!.assignmentCount.toString() ?? "")
            ],
          ),
        )
        : const CircularProgressIndicator(),
        
        controller.isAssignmentLoaded.value
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller
                    .eventPointAssignmentModel.value?.assignedPoliceList?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      
                      children: [
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].buckleNumber ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].policeName ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].district ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].policeStationName ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].age ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].gender ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].number ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].dutyStartDate ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].dutyEndDate ?? ""),
                        Text(controller.eventPointAssignmentModel.value?.assignedPoliceList?[index].number ?? ""),
                      ],
                    ),
                  );
                })
            : Container()
      
      ],
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
        child: DropdownButton(
            value: controller.selectedEventId.value,
            items: controller.events.value?.map((event) {
              return DropdownMenuItem(
                  value: event.id, child: Text(event.eventName.toString()));
            }).toList(),
            onChanged: (value) {
              controller.changeSelectedEvent(value);
            }));
  }

  Widget pointSelectionDropDownWidget() {
    return Container(
        child: DropdownButton(
            value: controller.selectedPointId.value,
            items: controller.points.value?.map((point) {
              return DropdownMenuItem(
                  value: point.id, 
                  child: Text(point.pointName.toString()));
            }).toList(),
            onChanged: (value) {
              controller.changeSelectedPoint(value);
            }));
  }

  Widget showAssignmentButton() {
    return Container(
        child: ElevatedButton(
            onPressed: controller.showAssignments,
            child: const Text("Show Assignments")));
  }
}
