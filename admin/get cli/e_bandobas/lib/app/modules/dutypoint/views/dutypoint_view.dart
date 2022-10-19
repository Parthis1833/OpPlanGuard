import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dutypoint_controller.dart';

class DutypointView extends GetView<DutypointController> {
  const DutypointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('DutypointView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DutypointView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
