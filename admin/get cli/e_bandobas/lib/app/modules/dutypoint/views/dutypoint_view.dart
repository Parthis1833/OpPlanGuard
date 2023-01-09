import 'package:e_bandobas/app/Widgets/Buttons/collapsebutton.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
import 'package:e_bandobas/app/Widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dutypoint_controller.dart';

class DutypointView extends GetView<DutypointController> {
  const DutypointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const  Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('DutypointView'),
        centerTitle: true,
      ),
      body:ListView(
        children: [
          PolicCard(
            margin: const EdgeInsets.all(8),
            color: Colors.grey,
            child: const Align(
              child: Text(''),
            ),
          ),
          Container(
            child: const Text('hey'),
          ),
        ],
      ),
      floatingActionButton: const CollapseButton(),
    );
  }
}
