import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/police_station_controller.dart';

class PoliceCreateView extends GetView<PoliceStationController> {
  const PoliceCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PoliceCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PoliceCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
