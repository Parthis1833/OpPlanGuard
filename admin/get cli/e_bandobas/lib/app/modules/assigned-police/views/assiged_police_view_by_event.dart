import 'package:e_bandobas/app/modules/assigned-police/controllers/assiged_police_view_by_event_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Config/routes/app_pages.dart';
import '../../../Widgets/navigation_drawer.dart';
import '../controllers/assigned_police_controller.dart';

class AssignedPoliceByEventView extends GetView<AssignedPoliceByEventController> {
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
    ]);
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

  // Widget pointSelectionDropDownWidget() {
  //   return DropdownButton(
  //       value: controller.selectedPointId.value,
  //       items: controller.points.value?.map((point) {
  //         return DropdownMenuItem(
  //             value: point.id, child: Text(point.pointName.toString()));
  //       }).toList(),
  //       onChanged: (value) {
  //         controller.changeSelectedPoint(value);
  //       });
  // }

  Widget showAssignmentButton() {
    return ElevatedButton(
        onPressed: controller.showAssignments,
        child: const Text("Show Assignments"));
  }
}
