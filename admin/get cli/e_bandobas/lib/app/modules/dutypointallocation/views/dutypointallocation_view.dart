import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dutypointallocation_controller.dart';

class DutypointallocationView extends GetView<DutypointallocationController> {
  const DutypointallocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Get.dialog(
        Center(
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Explanation about this page",
                      style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 16),
                  const Text(
                    "In this page, idk what will happen ",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Close Dialog"),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    });

    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('DutypointallocationView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          PoliceCard(
            margin: const EdgeInsets.all(8),
            color: Colors.grey,
            child: const Align(
              child: Text(''),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Assigned Police"),
                backgroundColor: Colors.lightGreen,
                onPressed: () {
                  Get.toNamed(PATHS.ASSIGNED_POLICE);
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Assigned Page")
            ],
          )),
    );
  }
}
