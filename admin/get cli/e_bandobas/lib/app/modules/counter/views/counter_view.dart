import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CounterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
