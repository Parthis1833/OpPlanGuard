import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/assesment_create_controller.dart';

class AssesmentCreateView extends GetView<AssesmentCreateController> {
  AssesmentCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssesmentCreateView'),
        centerTitle: true,
      ),
      body: Obx(() => (controller.designations.value == null &&
              controller.events.value == null)
          ? const CircularProgressIndicator()
          : popUpPageDataWidget()),
    );
  }

  Widget popUpPageDataWidget() {
    return ListView(
      children: [
        eventSelectionDropDownWidget(),
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
                  controller.saveEventAssignment();
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
    print("length = " +  controller.events.value!.length.toString());
    return controller.events.value!.length > 0
        ? Container(
            child: DropdownButton(
                hint: Text("select event"),
                value: controller.selectedEventId.value == 0
                    ? null
                    : controller.selectedEventId.value,
                items: controller.events.value?.map((event) {
                  return DropdownMenuItem(
                      value: event.id, child: Text(event.eventName.toString()));
                }).toList(),
                onChanged: (value) {
                  controller.changeSelectedEvent(value);
                }))
        : Container();
  }
}
