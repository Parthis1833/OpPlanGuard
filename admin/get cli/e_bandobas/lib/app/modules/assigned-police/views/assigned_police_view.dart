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
        Obx(()=> controller.isAssignmentLoaded.value 
        ? Container(
          child: Column(
            children: [
              Text(controller.eventPointAssignmentModel.assignmentCount.toString() ?? "")
            ],
          ),
        )
        : const CircularProgressIndicator()),
        
        
        Obx(() => controller.isAssignmentLoaded.value
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller
                    .eventPointAssignmentModel.assignedPoliceList?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      
                      children: [
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].buckleNumber ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].policeName ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].district ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].policeStationName ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].age ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].gender ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].number ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].dutyStartDate ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].dutyEndDate ?? ""),
                        Text(controller.eventPointAssignmentModel.assignedPoliceList?[index].number ?? ""),
                      ],
                    ),
                  );
                })
            : Container())
      
      ],
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
        child: DropdownButton(
            value: controller.selectedEventId.value,
            items: controller.events.value!.map((event) {
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
            items: controller.points.value!.map((point) {
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
