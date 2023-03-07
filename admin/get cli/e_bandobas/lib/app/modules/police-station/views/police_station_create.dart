import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/police_station_create_controller.dart';

class PoliceStationCreateView extends GetView<PoliceStationCreateController> {
  const PoliceStationCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoliceStationCreateView'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: controller.pickAndUploadFile,
              child: Text("Pick & upload police station"))),
    );
  }
}
