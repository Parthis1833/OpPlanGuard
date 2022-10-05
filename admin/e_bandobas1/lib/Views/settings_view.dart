import 'package:e_bandobas1/Resources/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../Controller/assessment_controller.dart';

class SettingsView  extends GetView<AssessmentController>{
  const SettingsView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 28, 54, 105),
        title: const Text('Settings '),
        centerTitle: true,
      ),
      body:Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.95,
          child: const Card(

        ),
      ),
    );
  }
}