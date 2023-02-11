import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Config/routes/app_pages.dart';
import '../controllers/assigned_police_controller.dart';

class AssignedPoliceView extends GetView<AssignedPoliceController> {
  const AssignedPoliceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Assigne Police View'),
          centerTitle: true,
        ),
        body: Obx(() => (controller.events.value!.isEmpty &&
                controller.points.value!.isEmpty)
            ? const CircularProgressIndicator()
            : assesmentDataWidget()),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(6),
            width: 125,
            height: 60,
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
                  Get.toNamed(PATHS.ASSIGNED_POLICE_ADD);
                },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Add"),
                    ),
                ),
          ),
        ),
    );
  }

  Widget assesmentDataWidget() {
    return ListView(
      children: [
        Row(
          children: [
            eventSelectionDropDownWidget(),
            pointSelectionDropDownWidget(),
            showAssignmentButton(),
          ],
        ),
        Obx(()=>controller.isAssignmentLoaded.value
            ? Column(
              children: [
                Text(controller
                        .eventPointAssignmentModel.value!.assignmentCount
                        .toString())
              ],
            )
            : Container()),
        Wrap(
          spacing: 5.0,
          children: const [
            Text("buckle number"),
            Text("police name"),
            Text("district"),
            Text("police station name"),
            Text("age"),
            Text("gender"),
            Text("number"),
            Text("duty starting date"),
            Text("duty ending date"),
          ],
        ),  
        controller.isAssignmentLoaded.value
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.eventPointAssignmentModel.value
                    ?.assignedPoliceList?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                    child: Wrap(
                      spacing: 5.0,
                      children: [
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].buckleNumber ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].policeName ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].district ??
                            ""),
                        Text(controller
                                .eventPointAssignmentModel
                                .value
                                ?.assignedPoliceList?[index]
                                .policeStationName ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].age ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].gender ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].number ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].dutyStartDate ??
                            ""),
                        Text(controller.eventPointAssignmentModel.value
                                ?.assignedPoliceList?[index].dutyEndDate ??
                            ""),
                      ],
                    ),
                  );
                })
            : Container()
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

  Widget showAssignmentButton() {
    return Container(
      padding: EdgeInsets.all(6),
      height:50,
      width: 250,
      child: ElevatedButton(
          onPressed: controller.showAssignments,
          child: const Text("Show Assignments")),
    );
  }
}
