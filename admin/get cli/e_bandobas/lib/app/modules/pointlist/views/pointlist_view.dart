import 'package:e_bandobas/app/modules/pointlist/views/PointViewDataGrid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resource/drawer/navigation_drawer.dart';
import '../controllers/pointlist_controller.dart';

class PointlistView extends GetView<PointlistController> {
  const PointlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('PointlistView'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          PointViewDataGrid()
        ],
      ),
    );
  }
}
