import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dutypointallocation_controller.dart';

class DutypointallocationView extends GetView<DutypointallocationController> {
  const DutypointallocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('DutypointallocationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DutypointallocationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
