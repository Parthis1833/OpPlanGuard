import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/police_station_controller.dart';

class PoliceStationCreateView extends GetView<PoliceStationController> {
  const PoliceStationCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoliceStationCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PoliceStationCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
