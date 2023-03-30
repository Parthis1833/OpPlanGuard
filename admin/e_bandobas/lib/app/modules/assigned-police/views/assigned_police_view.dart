import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Obx(() =>
          (controller.events.value == null || controller.points.value == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(child: CircularProgressIndicator.adaptive()),
                  ],
                )
              : assesmentDataWidget()),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
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
                    CustomRouteManager.ASSIGNED_POLICE_ADD();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.deepPurple,
                        size: 25,
                      ),
                      Text("Add"),
                    ],
                  )),
            ),
          ),
        ],
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
        Obx(() => (controller.eventPointAssignmentModel.value == null ||
                controller.eventPointAssignmentModel.value!.assignmentCount ==
                    0)
            ? Container()
            : (controller.eventPointAssignmentModel.value == null ||
                    controller
                            .eventPointAssignmentModel.value!.assignmentCount ==
                        0)
                ? Container()
                : DataTable(
                    columns: const [
                      DataColumn(label: Text('Index')),
                      DataColumn(label: Text('Designation')),
                      DataColumn(label: Text('Buckle Number')),
                      DataColumn(label: Text('Police Name')),
                      DataColumn(label: Text('District')),
                      DataColumn(label: Text('Police Station Name')),
                      DataColumn(label: Text('Age')),
                      DataColumn(label: Text('Gender')),
                      DataColumn(label: Text('Number')),
                      DataColumn(label: Text('Duty Start Date')),
                      DataColumn(label: Text('Duty End Date')),
                    ],
                    rows: controller.eventPointAssignmentModel.value
                            ?.assignedPoliceList!
                            .asMap()
                            .map((index4, item) => MapEntry(
                                index4,
                                DataRow(cells: [
                                  DataCell(Text((index4 + 1).toString())),
                                  DataCell(Text(item.designation ?? '')),
                                  DataCell(Text(item.buckleNumber ?? '')),
                                  DataCell(Text(item.policeName ?? '')),
                                  DataCell(Text(item.district ?? '')),
                                  DataCell(Text(item.policeStationName ?? '')),
                                  DataCell(Text(item.age ?? '')),
                                  DataCell(Text(item.gender ?? '')),
                                  DataCell(Text(item.number ?? '')),
                                  DataCell(Text(item.dutyStartDate ?? '')),
                                  DataCell(Text(item.dutyEndDate ?? '')),
                                ])))
                            .values
                            .toList() ??
                        const [],
                  )),
      ],
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
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
                  value: event.id,
                  child: Text(
                    event.eventName.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black38,
                        fontSize: 25.0),
                  ),
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
                    value: point.id,
                    child: Text(
                      point.pointName.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                          fontSize: 24.0),
                    ),
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
      width: 150,
      height: 50,
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
          onPressed: controller.showAssignments,
          child: const Text("Show Assignments")),
    );
  }
}
