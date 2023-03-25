import '../../../resource/drawer/navigation_drawer.dart';
import '../controllers/show_point_assignment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class ShowPointAssigment extends GetView<ShowPointPoliceAssementController> {
  const ShowPointAssigment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('Point assigments view'),
        centerTitle: true,
      ),
      body: Obx(() =>
          (controller.events.value == null || controller.points.value == null)
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: CircularProgressIndicator()),
                ],
              )
              : showPointAssementDataWidget()),
    );
  }

  Widget showPointAssementDataWidget() {
    return ListView(
      children: [
        Row(
          children: [
            eventSelectionDropDownWidget(),
            pointSelectionDropDownWidget()
          ],
        ),
        designationListWidget(),
        viewUpdateContainerRow(),
      ],
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
                'બંદોબસ્તનું નામ  :-',
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
            width: 350,
            child: DropdownButton(
                value: controller.selectedPointId.value,
                isExpanded: true,
                itemHeight: 60,
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

  Widget designationListWidget() {
    return (controller.isPointPoliceCountAssigned.value == null ||
            controller.isPointPoliceCountAssigned.value == false)
        ? Container()
        : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: (controller.pointPoliceCountAssignment.value!.assignments!.length / 2).ceil(),
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
                        // controller.designations.value![index * 2].name.toString()
                         controller.pointPoliceCountAssignment.value!.assignments![index * 2 ].designationName.toString(),
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
                    ), (index * 2 + 1 < controller.pointPoliceCountAssignment.value!.assignments!.length)
                        ? Container(
                      width: 200,
                      height: 70,
                      margin: const EdgeInsets.only(left: 40.0),
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(//Text(controller.pointPoliceCountAssignment.value
                          //                 ?.assignments?[index].designationName ??
                        controller.pointPoliceCountAssignment.value!.assignments![index * 2 + 1].designationName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                            fontSize: 26.0),
                      ),
                    )
                        : Container(), (index * 2 + 1 < controller.pointPoliceCountAssignment.value!.assignments!.length)
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
          );
  }

  Widget viewUpdateContainerRow() {
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
                  controller.loadPointPoliceAssignmentData();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "View",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 36,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: make update ui and send event id and point id to it.
                  // controller.savePointAssignment();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
