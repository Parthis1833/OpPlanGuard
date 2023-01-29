import '../../../Widgets/navigation_drawer.dart';
import '../controllers/show_point_assignment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class ShowPointAssigment extends GetView<ShowPointPoliceAssementController> {
  const ShowPointAssigment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point assigments view'),
        centerTitle: true,
      ),
      body: Obx(() =>
          (controller.events.value == null && controller.points.value == null)
              ? const CircularProgressIndicator()
              : showPointAssementDataWidget()),
    );
  }

  Widget showPointAssementDataWidget() {
    return ListView(
      children: [
        eventSelectionDropDownWidget(),
        pointSelectionDropDownWidget(),
        designationListWidget(),
        viewUpdateContainerRow(),
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
                  value: point.id, child: Text(point.pointName.toString()));
            }).toList(),
            onChanged: (value) {
              controller.changeSelectedPoint(value);
            }));
  }

  Widget designationListWidget() {
     return controller.isPointPoliceCountAssigned.value
        ? 
    ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount:
          controller.pointPoliceCountAssignment.value?.assignments?.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 160.0),
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                controller.pointPoliceCountAssignment.value?.assignments?[index]
                        .designationName ??
                    "No data",
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
                enabled: false,
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
    ) : Container();
  }

  Widget viewUpdateContainerRow() {
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
                  controller.loadPointPoliceAssignmentData();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "View",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: make update ui and send event id and point id to it.
                  // controller.savePointAssignment();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
