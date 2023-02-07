import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Config/routes/app_pages.dart';
import '../controllers/assigned_police_controller.dart';

class AssignedPoliceView extends GetView<AssignedPoliceController> {
  const AssignedPoliceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AssignedPoliceView'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    // iconColor: Colors.black,
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                    textStyle: MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return size 40, otherwise 20
                      if (states.contains(MaterialState.pressed)) {
                        return const TextStyle(fontSize: 40);
                      }
                      return const TextStyle(fontSize: 20);
                    }),
                  ),
                  onPressed: () {
                    Get.toNamed(PATHS.ASSIGNED_POLICE_ADD);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.deepPurple,
                        size: 25,
                      ),
                      Text("Add"),
                    ],
                  )),
            ),
          ],
        ),
        body: Obx(() => (controller.events.value!.isEmpty &&
                controller.points.value!.isEmpty)
            ? const CircularProgressIndicator()
            : assesmentDataWidget()));
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
        Obx(()=>controller.isAssignmentLoaded.value
            ? Column(
              children: [
                Text(controller
                        .eventPointAssignmentModel.value!.assignmentCount
                        .toString())
              ],
            )
            : Container()),
        Wrap(
          spacing: 5.0,
          children: const [
            Text("buckle number"),
            Text("police name"),
            Text("district"),
            Text("police station name"),
            Text("age"),
            Text("gender"),
            Text("number"),
            Text("duty starting date"),
            Text("duty ending date"),
          ],
        ),
        controller.isAssignmentLoaded.value
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.eventPointAssignmentModel.value
                    ?.assignedPoliceList?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Wrap(
                      spacing: 5.0,
                      // scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,

                      children: [
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].buckleNumber ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].policeName ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].district ??
                            ""),
                        Text(controller
                                .eventPointAssignmentModel
                                .value
                                ?.assignedPoliceList?[index]
                                .policeStationName ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].age ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].gender ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].number ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].dutyStartDate ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].dutyEndDate ??
                            ""),
                      ],
                    ),
                  );
                })
            : Container()
      ],
    );
  }

  Widget eventSelectionDropDownWidget() {
    return DropdownButton(
        value: controller.selectedEventId.value,
        items: controller.events.value?.map((event) {
          return DropdownMenuItem(
              value: event.id, child: Text(event.eventName.toString()));
        }).toList(),
        onChanged: (value) {
          controller.changeSelectedEvent(value);
        });
  }

  Widget pointSelectionDropDownWidget() {
    return DropdownButton(
        value: controller.selectedPointId.value,
        items: controller.points.value?.map((point) {
          return DropdownMenuItem(
              value: point.id, child: Text(point.pointName.toString()));
        }).toList(),
        onChanged: (value) {
          controller.changeSelectedPoint(value);
        });
  }

  Widget showAssignmentButton() {
    return ElevatedButton(
        onPressed: controller.showAssignments,
        child: const Text("Show Assignments"));
  }
}
