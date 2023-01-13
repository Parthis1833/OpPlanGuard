import 'package:e_bandobas/app/jsondata/officersdata/OfficersDataGrid.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
import 'package:e_bandobas/app/Widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/officerdata_controller.dart';

class OfficerdataView extends GetView<OfficerdataController> {
  OfficerdataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('OfficerdataView'),
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
          OfficerDataGrid(),
        ],
      ),
    );
  }
}
