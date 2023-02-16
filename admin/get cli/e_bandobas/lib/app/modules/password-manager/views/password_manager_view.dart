import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/password_manager_controller.dart';

/**
 * THis page will display password history as well support password creation for multiple events
 */
class PasswordManagerView extends GetView<PasswordManagerController> {
  const PasswordManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
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
                    "In this page, You can see all your past password details, who used it for which event and which purpose",
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
      appBar: AppBar(
        title: const Text('Password History View'),
        centerTitle: true,
      ),
      body: Obx(() => (controller.events.value == null ||
              controller.passwordHistories.value == null)
          ? const CircularProgressIndicator()
          : Center(child: passwordManagerWidget())),
    );
  }

  Widget passwordManagerWidget() {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            eventSelectionDropDownWidget(),
            makePasswordWidgetButton()
          ],
        ),
        displayHistoryHeader(),
        loadHistories(),
      ],
    );
  }

  Widget makePasswordWidgetButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 100,
        height: 50,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return Colors.blue;
              }),
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(fontSize: 40);
                }
                return const TextStyle(fontSize: 20);
              }),
            ),
            onPressed: () {
              controller.createPassword();
            },
            child: Row(
              children: const [
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 25,
                ),
                Text("Create passwords"),
              ],
            )),
      ),
    );
  }

  Widget eventSelectionDropDownWidget() {
    return SizedBox(
      height: 55,
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
                        fontSize: 28.0),
                  ),
                ));
          }).toList(),
          onChanged: (value) {
            controller.changeSelectedEvent(value);
          }),
    );
  }

  Widget loadHistories() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => buildPasswordHistory(index),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: controller.passwordHistories.value!.histories!.length);
    // controller.passwordHistories.value.histories.map((History) => )
  }

  Widget buildPasswordHistory(int index) {
    return Row(
      children: [
        Text(controller.passwordHistories.value!.histories![index].eventName ??
            ''),
        Text(controller.passwordHistories.value!.histories![index].userName ??
            ''),
        Text(
            controller.passwordHistories.value!.histories![index].phoneNumber ??
                ''),
        Text(controller.passwordHistories.value!.histories![index].ip ?? ''),
        Text(controller.passwordHistories.value!.histories![index].accessType ??
            ''),
      ],
    );
  }

  Widget displayHistoryHeader() {
    return Row(
      children: [
        Text("Event Name"),
        Text("User name"),
        Text("Phone Number"),
        Text("Ip of user"),
        Text("Access type of user"),
      ],
    );
  }
}
