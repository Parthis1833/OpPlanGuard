import 'package:e_bandobas/app/modules/dutypoint/views/pointview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../Widgets/Buttons/collapsebutton.dart';
import '../../../resource/drawer/navigation_drawer.dart';
import '../controllers/dutypoint_controller.dart';


  class DutypointView extends GetView<DutypointController> {
  const DutypointView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('DutypointView'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          PointDataGrid()
        ],
      ),
      floatingActionButton: const CollapseButton(),
    );
  }



 }