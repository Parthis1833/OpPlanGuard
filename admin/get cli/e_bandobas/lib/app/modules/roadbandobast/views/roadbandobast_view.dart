import 'package:e_bandobas/app/resource/button/roadbandobashbutton.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/roadbandobast_controller.dart';

class RoadbandobastView extends GetView<RoadbandobastController> {
  const RoadbandobastView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('RoadbandobastView'),
        centerTitle: true,
      ),
      body: ListView(

      ),
      floatingActionButton: const RoadbandobasButton(),
    );
  }
}
