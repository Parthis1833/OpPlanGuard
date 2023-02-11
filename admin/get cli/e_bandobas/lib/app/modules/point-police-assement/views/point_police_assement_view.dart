import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/point_police_assement_controller.dart';

class PointPoliceAssementView extends GetView<PointPoliceAssementController> {
  const PointPoliceAssementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 3), () {
      Get.dialog(
  Center(
    child: Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello World!", style: TextStyle(fontSize: 24)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text("Close Dialog"),
          ),
        ],
      ),
    ),
  ),
  barrierDismissible: false,
);

    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point Assesment CreateView'),
        centerTitle: true,
      ),
      body: Obx(() => (controller.designations.value == null ||
              controller.events.value == null  ||
              controller.points.value == null )
          ? const CircularProgressIndicator()
          : eventPoliceAssementWidget()),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Show Point Assesment"),
                backgroundColor: Colors.green,
                onPressed: () {
                  Get.toNamed(PATHS.SHOW_POINTS_ASSESMENT);
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 45.4,
                ),
              ),
              const Text("Show Point Assesment")
            ],
          ),
        ),
      ),
    );
  }

  Widget eventPoliceAssementWidget() {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    eventSelectionDropDownWidget(),
                    pointSelectionDropDownWidget()
                  ],
                ),
                designationListWidget(),
              ],
            ),
          ],
        ),
        saveCancelContainerRow(),
      ],
    );
  }

  Widget designationListWidget() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 880,
          height: 600,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: (controller.designations.value!.length / 2).ceil(),
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(left: 10,bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 70,
                      margin: const EdgeInsets.only(left: 40.0),
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        controller.designations.value![index * 2].name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                            fontSize: 26.0),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:10,right:10),
                      width: 150,
                      height: 45,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
                        controller:
                            controller.designationTextEditingControllers[index * 2],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.lightBlueAccent),
                          ),
                          hintText: '',
                        ),
                      ),
                    ),
                    (index * 2 + 1 < controller.designations.value!.length)
                        ? Container(
                            width: 200,
                            height: 70,
                            margin: const EdgeInsets.only(left: 40.0),
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              controller.designations.value![index * 2 + 1].name
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38,
                                  fontSize: 26.0),
                            ),
                          )
                        : Container(),
                    (index * 2 + 1 < controller.designations.value!.length)
                        ? SizedBox(
                            width: 150,
                            height: 45,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ], // Only numbers can be entered
                              controller: controller
                                  .designationTextEditingControllers[index * 2 + 1],
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.lightBlueAccent),
                                ),
                                hintText: '',
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget saveCancelContainerRow() {
    return Container(
      alignment: FractionalOffset.center,
      width: 580,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  controller.savePointAssignment();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
          children: [
        Container(
          margin: const EdgeInsets.only(left: 160.0),
          padding: const EdgeInsets.only(bottom: 2.0),
          height: 55,
          width: 250,
          child: const Text(
            'સોંપણીનું નામ  :-',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black38,
                fontSize: 38.0),
          ),
        ),
        Container(
          height: 55,
          width: 300,
          margin: const EdgeInsets.all(10),
          child: DropdownButton(
              value: controller.selectedEventId.value,
              items: controller.events.value!.map((event) {
                return DropdownMenuItem(
                  alignment: Alignment.center,
                    value: event.id, child: Text(event.eventName.toString() ,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black38,
                      fontSize: 25.0),),
                );
              }).toList(),
              onChanged: (value) {
                controller.changeSelectedEvent(value);
              }),
        ),
      ]),
    );
  }

  Widget pointSelectionDropDownWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 160.0),
            padding: const EdgeInsets.only(bottom: 2.0),
            height: 55,
            width: 250,
            child: const Text(
              'પોઇન્ટનું નામ  :-',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black38,
                  fontSize: 38.0),
            ),
          ),
          SizedBox(
            height: 55,
            width: 300,
            child: DropdownButton(
                value: controller.selectedPointId.value,
                items: controller.points.value!.map((point) {
                  return DropdownMenuItem(
                      value: point.id, child: Text(point.pointName.toString() ,
                      style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                      fontSize: 24.0),),
                     );
                }).toList(),
                onChanged: (value) {
                  controller.changeSelectedPoint(value);
                }),
          ),
        ],
      ),
    );
  }
}
