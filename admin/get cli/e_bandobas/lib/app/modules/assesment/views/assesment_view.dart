import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/assesment_controller.dart';



class AssesmentView extends GetView<AssesmentController> {
  const AssesmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('Assesment View'),
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
      floatingActionButton: assementButton(),
    );
  }

  Widget assementButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Events"),
                backgroundColor: Colors.cyanAccent,
                onPressed: () {
                  Get.toNamed(PATHS.EVENT_SHOW);
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Event page")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Event Assement"),
                backgroundColor: const Color.fromARGB(100, 28, 54, 105),
                onPressed: () {
                  Get.toNamed(PATHS.ASSESMENT_CREATE);
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Event Assement")
            ],
          ),
        ),
      ],
    );
  }
}
