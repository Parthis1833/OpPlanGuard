import 'package:e_bandobas/app/modules/pointlist/views/PointViewDataGrid.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pointlist_controller.dart';

class PointlistView extends GetView<PointlistController> {
  const PointlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PointlistView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          PolicCard(
            margin: const EdgeInsets.all(8),
            color: Colors.grey,
            child: const Align(
              child: Text(''),
            ),
          ),
          const PointViewDataGrid()
        ],
      ),
    );
  }
}
