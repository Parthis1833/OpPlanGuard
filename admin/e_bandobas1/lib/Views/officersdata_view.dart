import 'package:e_bandobas1/Resources/Card/PoliceCard.dart';
import 'package:e_bandobas1/Resources/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/assessment_controller.dart';

class OfficersDataView extends GetView<AssessmentController> {
  const OfficersDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 28, 54, 105),
        title: const Text('Officers Data '),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.zero,
        color: const Color.fromARGB(128, 73, 89, 110),
        child: PolicCard(
          margin: const EdgeInsets.all(8),
          color: Colors.grey,
          child: const Align(
            child: Text(''),
          ),
        ),
      ),
    );
  }
}
