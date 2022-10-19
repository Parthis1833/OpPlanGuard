import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/roadbandobast_controller.dart';

class RoadbandobastView extends GetView<RoadbandobastController> {
  const RoadbandobastView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('RoadbandobastView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RoadbandobastView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
