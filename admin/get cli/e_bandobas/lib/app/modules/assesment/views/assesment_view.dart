import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:e_bandobas/app/modules/assesment-create/views/assesment_create_view.dart';
import 'package:e_bandobas/app/resource/button/assessmentbutton.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/assesment_controller.dart';

/**
 * This page is intended to show existing assements as per events
 */

class AssesmentView extends GetView<AssesmentController> {
  const AssesmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('AssesmentView'),
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
          const Text('hey'),
        ],
      ),
      // floatingActionButton: AssesmentButton(),
      floatingActionButton: assementButton(),
    );
  }

  Widget assementButton() {
    return FloatingActionButton(
      heroTag: const Text("AssessmentButton"),
      backgroundColor: const Color.fromARGB(100, 28, 54, 105),
      onPressed: () {
        Get.toNamed("/assesment-create");
      },
      child: const Icon(
        Icons.add_circle_outline,
        color: Colors.deepPurple,
        size: 56.4,
      ),
    );
  }
}
