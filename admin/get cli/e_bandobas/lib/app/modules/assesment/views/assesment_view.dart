import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../resource/card/PoliceCardV2.dart';
import '../controllers/assesment_controller.dart';

class AssesmentView extends GetView<AssesmentController> {
  const AssesmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('Assesment View'),
        centerTitle: true,
        actions: [
          Obx(() => controller.events.value == null
              ? const CircularProgressIndicator.adaptive()
              : eventSelectionDropDownWidget()),
          ElevatedButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
      body: ListView(
        children: [
          Obx(() => controller.eventAssignmentCounts.value == null
              ? const CircularProgressIndicator.adaptive()
              : PoliceCardV2(
                  eventAssignments: controller.eventAssignmentCounts.value!))
        ],
      ),
      floatingActionButton: assementButton(),
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
      height: 45,
      width: 600,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            height: 35,
            width: 300,
            child: DropdownButton(
                hint: const Text("select event"),
                value: controller.selectedEventId.value == 0
                    ? null
                    : controller.selectedEventId.value,
                items: controller.events.value?.map((event) {
                  return DropdownMenuItem(
                      value: event.id,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          event.eventName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                              fontSize: 18.0),
                        ),
                      ));
                }).toList(),
                onChanged: (value) {
                  controller.changeSelectedEvent(value);
                }),
          ),
        ],
      ),
    );
  }

  Widget assementButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Events"),
                backgroundColor: Colors.cyanAccent,
                onPressed: () {
                  CustomRouteManager.EVENT_SHOW();
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Event page")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Event Assement"),
                backgroundColor: const Color.fromARGB(100, 28, 54, 105),
                onPressed: () {
                  CustomRouteManager.ASSESMENT_CREATE();
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Event Assement")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Add Police"),
                backgroundColor: const Color.fromARGB(100, 28, 54, 105),
                onPressed: () {
                  CustomRouteManager.POLICE_CREATE();
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Add Police")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Police Station"),
                backgroundColor: const Color.fromARGB(100, 28, 54, 105),
                onPressed: () {
                  CustomRouteManager.POLICE_STATION();
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Police stations")
            ],
          ),
        ),
      ],
    );
  }
}
