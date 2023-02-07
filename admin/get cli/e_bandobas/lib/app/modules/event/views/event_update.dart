import 'package:e_bandobas/app/modules/event/controllers/event_update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventUpdateView extends GetView<EventUpdateController> {
  const EventUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EventView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
