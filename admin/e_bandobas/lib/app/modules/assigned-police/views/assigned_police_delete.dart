import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assigned_police_delete_controller.dart';

class AssignedPoliceDeleteView extends GetView<AssignedPoliceDeleteController> {
  const AssignedPoliceDeleteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Police View'),
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
