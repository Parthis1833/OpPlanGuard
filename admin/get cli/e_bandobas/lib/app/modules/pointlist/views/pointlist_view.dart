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
      body: Center(
        child: Text(
          'PointlistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
