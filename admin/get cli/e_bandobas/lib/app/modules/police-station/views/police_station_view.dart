import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/police_station_controller.dart';

class PoliceStationView extends GetView<PoliceStationController> {
  const PoliceStationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoliceStationView'),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.POLICE_STATION_CREATE);
              },
              child: Text("+ add police station")),
        ],
      ),
      body: const Center(
        child: Text(
          'PoliceStationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
