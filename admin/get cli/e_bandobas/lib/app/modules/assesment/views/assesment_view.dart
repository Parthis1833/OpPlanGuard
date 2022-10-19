import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/assesment_controller.dart';

class AssesmentView extends GetView<AssesmentController> {
  const AssesmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('AssesmentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AssesmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
