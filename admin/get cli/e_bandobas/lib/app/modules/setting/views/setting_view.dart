import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:e_bandobas/app/resource/drawer/settingdrawer.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          : SettingManagerWidget()),
    );
  }

  Widget SettingManagerWidget() {
    return Row(
      children: [
        SettingDrawer(),
    //   GestureDetector(
    //   behavior: HitTestBehavior.translucent,
    //   onTap: () {},
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       const Text('Toggle Theme'),
    //       Switch(
    //         value: controller.darkTheme.value,
    //         onChanged: (value) {
    //           controller.toggleTheme();
    //           if (value) {
    //             // Set the app's theme to dark mode when the toggle switch is turned on
    //             Get.changeTheme(ThemeData.dark());
    //             // Set the background color to dark when the toggle switch is turned on
    //             SystemChrome.setSystemUIOverlayStyle(
    //               const SystemUiOverlayStyle(
    //                 statusBarColor: Colors.black,
    //                 systemNavigationBarColor: Colors.black,
    //               ),
    //             );
    //           } else {
    //             // Set the app's theme back to light mode when the toggle switch is turned off
    //             Get.changeTheme(ThemeData.light());
    //             // Set the background color back to light when the toggle switch is turned off
    //             SystemChrome.setSystemUIOverlayStyle(
    //               const SystemUiOverlayStyle(
    //                 statusBarColor: Colors.white,
    //                 systemNavigationBarColor: Colors.white,
    //               ),
    //             );
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    // ),
        Align(
          alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          eventSelectionDropDownWidget(),
                          makePasswordWidgetButton(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: loadHistories(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ),

    ],
    );
  }


  Widget makePasswordWidgetButton() {
    return SizedBox(
      width: 225,
      height: 50,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
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
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 160.0),
          height: 55,
          width: 250,
          child: const Text(
            'સોંપણીનું નામ  :-',
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 32.0),
          ),
        ),
        SizedBox(
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
                            fontWeight: FontWeight.w200,
                            fontSize: 26.0),
                      ),
                    ));
              }).toList(),
              onChanged: (value) {
                controller.changeSelectedEvent(value);
              }),
        ),
      ],
    );
  }

  Widget loadHistories() {
    return SizedBox(
      height: 250, // set the height to a fixed value
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Event Name")),
            DataColumn(label: Text("User name"), numeric: false),
            DataColumn(label: Text("Phone Number"), numeric: false),
            DataColumn(label: Text("Ip of user"), numeric: false),
            DataColumn(label: Text("Access type of user"), numeric: false),
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
        ),
      ),
    );
  }
}