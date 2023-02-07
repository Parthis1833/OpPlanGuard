import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/point_police_assement_controller.dart';


class PointPoliceAssementView extends GetView<PointPoliceAssementController> {
  const PointPoliceAssementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssesmentCreateView'),
        centerTitle: true,
      ),
      body: Obx(() => (controller.designations.value!.isEmpty &&
              controller.events.value !.length >= 0 &&
              controller.points.value !.length >= 0)
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.bottomRight,
            child: Column(
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
        ),
        saveCancelContainerRow(),
      ],
    );
  }

  Widget designationListWidget() {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: (controller.designations.value!.length / 2).ceil(),
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Container(
                  width: 200,
                  height: 70,
                  margin: const EdgeInsets.only(left: 40.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    controller.designations.value![index * 2].name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                        fontSize: 26.0),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    controller:
                    controller.designationTextEditingControllers[index * 2],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.lightBlueAccent),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
                (index * 2 + 1 < controller.designations.value!.length)
                    ? Container(
                  width: 200,
                  height: 70,
                  margin: const EdgeInsets.only(left: 40.0),
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    controller.designations.value![index * 2 + 1].name
                        .toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                        fontSize: 26.0),
                  ),
                )
                    : Container(),

                (index * 2 + 1 < controller.designations.value!.length)
                    ? SizedBox(
                  width: 150,
                  height: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    controller:
                    controller.designationTextEditingControllers[index * 2 + 1],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.lightBlueAccent),
                      ),
                      hintText: '',
                    ),
                  ),
                ) : Container(),
              ],
            ),
          );
        },
      ),
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
    return DropdownButton(
        value: controller.selectedEventId.value,
        items: controller.events.value!.map((event) {
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
        items: controller.points.value!.map((point) {
          return DropdownMenuItem(
              value: point.id, child: Text(point.pointName.toString()));
        }).toList(),
        onChanged: (value) {
          controller.changeSelectedPoint(value);
        });
  }
}
