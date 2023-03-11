import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/police_create_controller.dart';

class PoliceCreateView extends GetView<PoliceCreateController> {
  final passwordController = TextEditingController();

  PoliceCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PoliceCreateView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Obx(() => controller.events.value == null
                ? const CircularProgressIndicator.adaptive()
                : eventSelectionDropDownWidget()),
            ElevatedButton(
                onPressed: () {
                  controller.passwordUpdated(passwordController.text);
                  controller.pickAndUploadFile();
                },
                child: Text("Pick & upload Polcies")),
            passwordInputWidget(),
            Text("Download the sample & add data & save in your pc to upload"),
            ElevatedButton(onPressed: controller.downloadPoliceSampleFile, child: Text("Download Sample"))
          ],
        ));
  }

  Widget passwordInputWidget() {
    return Container(
      width: 250,
      height: 200,
      child: TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter Password',
        ),
      ),
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
      height: 45,
      width: 600,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            height: 35,
            width: 300,
            child: DropdownButton(
                hint: const Text("select event"),
                value: controller.selectedEventId.value == 0
                    ? null
                    : controller.selectedEventId.value,
                items: controller.events.value?.map((event) {
                  return DropdownMenuItem(
                      value: event.id,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          event.eventName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                              fontSize: 18.0),
                        ),
                      ));
                }).toList(),
                onChanged: (value) {
                  controller.changeSelectedEvent(value);
                }),
          ),
        ],
      ),
    );
  }
}
