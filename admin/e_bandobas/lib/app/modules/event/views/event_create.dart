import 'package:e_bandobas/app/modules/event/controllers/event_create_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';


class EventCreateView extends GetView<EventCreateController> {
  const EventCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Event Create Page'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            eventNameAndEventDetailsWidget(),
            datePickersOfEvent(),
            saveCancelContainerRow()
          ],
        ));
  }

  Widget datePickersOfEvent() {
    return Row(
      children: [
        Obx(() => Column(
              children: [
                Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.startDate.value)
                      .toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.chooseStartDate();
                  },
                  child: const Text("Choose a start date"),
                )
              ],
            )),
        Obx(() => Column(
              children: [
                Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.endDate.value)
                      .toString(),
                  style: const TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.chooseEndDate();
                  },
                  child: const Text("Choose a End date"),
                )
              ],
            ))
      ],
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
                  controller.saveEvent();
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

  Widget eventNameAndEventDetailsWidget() {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "Event Name"),
          controller: controller.eventNameTextEditController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Event Details"),
          controller: controller.eventDetailsTextEditingController,
        ),
      ],
    );
  }
}
