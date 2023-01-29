import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/assigned_police_controller.dart';

class AssignedPoliceView extends GetView<AssignedPoliceController> {
  const AssignedPoliceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssignedPoliceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AssignedPoliceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
