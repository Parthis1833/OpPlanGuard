import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assigned_police_update_controller.dart';

class AssignedPoliceUpdateView extends GetView<AssignedPoliceUpdateController> {
  const AssignedPoliceUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssignedPoliceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AssignedPoliceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
