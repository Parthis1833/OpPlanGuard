import 'package:e_bandobas/app/modules/assigned-police/controllers/assiged_police_view_by_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Config/routes/app_pages.dart';
import '../../../Widgets/navigation_drawer.dart';

class AssignedPoliceByEventView
    extends GetView<AssignedPoliceByEventController> {
  const AssignedPoliceByEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.dialog(
        Center(
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Explanation about this page",
                      style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 16),
                  const Text(
                    "In this page, This page show information, police assigned in particular event and point.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Close Dialog"),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    });

    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('Assigned Police In Event'), //TODO: new name
        centerTitle: true,
      ),
      body: Obx(() => (controller.events.value == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(child: CircularProgressIndicator.adaptive()),
              ],
            )
          : assesmentDataWidget()),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                    textStyle: MaterialStateProperty.resolveWith((states) {
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
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                    textStyle: MaterialStateProperty.resolveWith((states) {
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
                      Text("Show By Event"),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget assesmentDataWidget() {
    return ListView(children: [
      Row(
        children: [
          eventSelectionDropDownWidget(),
          // pointSelectionDropDownWidget(),
          showAssignmentButton(),
        ],
      ),
      displayEventAssignment(),
    ]);
  }

  Widget displayEventAssignment() {
    return Obx(() => controller.eventAssignmentModel.value == null
        ? const CircularProgressIndicator.adaptive()
        : eventAssignments());
  }

  Widget eventAssignments() {
    return ListView.separated(
      shrinkWrap: true,
          physics: ClampingScrollPhysics(),
        itemBuilder: (_, index) => pointLevelAssignment(index),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: controller
            .eventAssignmentModel.value!.pointAssignments!.length);
    // controller.eventPointAssignmentModel.value!.pointAssignments!
    //     .map((model) => pointLevelAssignment())
    //     .toList();
  }

  Widget pointLevelAssignment(int index) {
    return Column(
      children: [
        Wrap(
          children: [
          Text("Point Name : ${controller.eventAssignmentModel.value!.pointAssignments![index].pointName!}"),
          const SizedBox(width: 20),
          Text("Zone Name : ${controller.eventAssignmentModel.value!.pointAssignments![index].zoneName!}"),
          const SizedBox(width: 20),
          Text("Total Assigned police : ${controller.eventAssignmentModel.value!.pointAssignments![index].assignmentCount!}"),
          const SizedBox(width: 20),
          Text("Accessories : ${controller.eventAssignmentModel.value!.pointAssignments![index].pointAccessories!}"),
          const SizedBox(width: 20),
          Text("Accessories : ${controller.eventAssignmentModel.value!.pointAssignments![index].pointRemarks!}"),
        ],),

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

        (controller.eventAssignmentModel.value == null || controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList!.length  ==  0)
            ? Container() : 
            ListView.builder(
              shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList!.length,
                itemBuilder: (context, idx2) {
                  return SizedBox(
                    height: 50,
                    child: Wrap(
                      spacing: 5.0,
                      children: [
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].buckleNumber ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].policeName ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].district ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].policeStationName ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].age ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].gender ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].number ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].dutyStartDate ??
                            ""),
                        Text(controller.eventAssignmentModel.value!.pointAssignments![index].assignedPoliceList![idx2].dutyEndDate ??
                            ""),
                      ],
                    ),
                  );
                }),
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

  Widget showAssignmentButton() {
    return ElevatedButton(
        onPressed: controller.showAssignments,
        child: const Text("Show Assignments"));
  }
}
