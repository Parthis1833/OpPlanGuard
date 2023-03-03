import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('SettingView'),
        centerTitle: true,
      ),
      body:  Obx(() => (controller.events.value == null ||
          controller.passwordHistories.value == null)
          ? const CircularProgressIndicator()
          : passwordManagerWidget()),
    );
  }
  Widget passwordManagerWidget() {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            eventSelectionDropDownWidget(),
            makePasswordWidgetButton(),
            loadHistories(),
          ],
        ),

      ],
    );
  }

  Widget makePasswordWidgetButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 225,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    return DataTable(
      columns: const [
        DataColumn(label: Text("Event Name")),
        DataColumn(label: Text("User name")),
        DataColumn(label: Text("Phone Number")),
        DataColumn(label: Text("Ip of user")),
        DataColumn(label: Text("Access type of user")),
      ],
      rows: controller.passwordHistories.value!.histories!.map((history) {
        return DataRow(
          cells: [
            DataCell(Text(history.eventName ?? '')),
            DataCell(Text(history.userName ?? '')),
            DataCell(Text(history.phoneNumber ?? '')),
            DataCell(Text(history.ip ?? '')),
            DataCell(Text(history.accessType ?? '')),
          ],
        );
      }).toList(),
    );
  }

}
