import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/event_controller.dart';

/**
 * This page will show all existing events 
 * and have 2 redirects, 
 * 1. redirect to create event page
 * 2. redirect to update event page
 */

class EventView extends GetView<EventController> {
  const EventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventView'),
        centerTitle: true,
      ),
      body: Obx(() => (controller.events.value == null &&
              controller.events.value!.isEmpty)
          ? const CircularProgressIndicator()
          : eventsPageData()),
      floatingActionButton: createEventButton(),
    );
  }

  Widget createEventButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: const Text("Create Event"),
              backgroundColor: const Color.fromARGB(100, 28, 54, 105),
              onPressed: () {
                Get.toNamed(PATHS.EVENT_CREATE);
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.deepPurple,
                size: 56.4,
              ),
            ),
            const Text("Create Event")
          ],
        ),
      ),
    ]);
  }

  Widget eventsPageData() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.events.value?.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // event name,
              Text(controller.events.value?[index].eventName ?? ""),
              // event details,
              Text(controller.events.value?[index].eventDetails ?? ""),
              // event startdate
              Text(controller.events.value?[index].eventStartDate ?? ""),
              // event enddate
              Text(controller.events.value?[index].eventEndDate ?? ""),
            ],
          );
        });
  }
}
