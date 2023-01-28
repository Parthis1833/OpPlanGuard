import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/point_police_assement_controller.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';

class PointPoliceAssementView extends GetView<PointPoliceAssementController> {
  const PointPoliceAssementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('AssesmentCreateView'),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: const Text("Show Point Assesment"),
                      backgroundColor: Colors.green,
                      onPressed: () {
                        Get.toNamed(PATHS.SHOW_POINTS_ASSESMENT);
                      },
                      child: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.deepPurple,
                        size: 45.4,
                      ),
                    ),
                    const Text("Show Point Assesment")
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Obx(() => (controller.designations.value!.isEmpty &&
              controller.events.value == null &&
              controller.points.value == null)
          ? const CircularProgressIndicator()
          : eventPoliceAssementWidget()),
    );
  }

  Widget eventPoliceAssementWidget() {
    return ListView(
      children: [
        eventSelectionDropDownWidget(),
        pointSelectionDropDownWidget(),
        designationListWidget(),
        saveCancelContainerRow()
      ],
    );
  }

  Widget designationListWidget() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: controller.designations.value!.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 160.0),
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                controller.designations.value![index].name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                    fontSize: 26.0),
              ),
            ),
            SizedBox(
              height: 45,
              width: 120,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                controller: controller.designationTextEditingControllers[index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.lightBlueAccent),
                  ),
                  hintText: '',
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget saveCancelContainerRow() {
    return Container(
      alignment: FractionalOffset.center,
      width: 580,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  controller.savePointAssignment();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
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
                  value: point.id, child: Text(point.pointName.toString()));
            }).toList(),
            onChanged: (value) {
              controller.changeSelectedPoint(value);
            }));
  }
}
