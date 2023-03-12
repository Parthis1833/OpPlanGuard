import 'package:e_bandobas/app/modules/dutypoint/views/PointViewDataGrid.dart';
import 'package:e_bandobas/app/resource/button/collapsebutton.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dutypoint_controller.dart';

class DutypointView extends GetView<DutypointController> {
  const DutypointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('DutypointView'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          PointViewDataGrid()
        ],
      ),
      floatingActionButton: const CollapseButton(),
    );
  }
}
