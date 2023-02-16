import 'package:e_bandobas/app/modules/assigned-police/controllers/assiged_police_view_by_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Config/routes/app_pages.dart';

class AssignedPoliceByEventView extends GetView<AssignedPoliceByEventController> {
   AssignedPoliceByEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Police In Event'), //TODO: new name
        centerTitle: true,
      ),
      body: Obx(() => (controller.events.value == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator.adaptive( strokeWidth: 5.0),
              ],
            ) : assesmentDataWidget()),
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
                    Get.toNamed(PATHS.ASSIGNED_POLICE_ADD);
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 200,
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
                    Get.toNamed(PATHS.ASSIGNED_POLICE_ADD);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.deepPurple,
                        size: 25,
                      ),
                      Text("Show By Event"),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
//me ek brack  le rha hu ok
// try solving b   //yess sir i know  tha terror i  slove in  15 min
  Widget assesmentDataWidget() {
    return ListView(children: [
      Row(
        children: [
          eventSelectionDropDownWidget(),
          showAssignmentButton(),
        ],
      ),
      displayEventAssignment(),
    ]);
  }

  Widget displayEventAssignment() {
    return Obx(() => controller.eventAssignmentModel.value == null
        ? const CircularProgressIndicator.adaptive()
        : eventAssignments());
  }
   Iterable<E> mapIndexed<E, T>(
       Iterable<T> items, E Function(int index, T item) f) sync* {
     var index1 = 0;

     for (final item in items) {
       yield f(index1, item);
       index1 = index1 + 1;
     }
   }
  Widget eventAssignments() {
    return ListView.separated(
      shrinkWrap: true,
          physics: ClampingScrollPhysics(),
        itemBuilder: (_, index) => pointLevelAssignment(index),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: controller
            .eventAssignmentModel.value!.pointAssignments!.length);
  }

  Widget pointLevelAssignment(int index) {
    return Column(
      children: [
        Wrap(
          children: [
            Text("Point Name : ${controller.eventAssignmentModel.value!.pointAssignments![index].pointName!}"),
            const SizedBox(width: 20),
            Text("Zone Name : ${controller.eventAssignmentModel.value!.pointAssignments![index].zoneName!}"),
            const SizedBox(width: 20),
            Text("Total Assigned police : ${controller.eventAssignmentModel.value!.pointAssignments![index].assignmentCount!}"),
            const SizedBox(width: 20),
            Text("Accessories : ${controller.eventAssignmentModel.value!.pointAssignments![index].pointAccessories!}"),
            const SizedBox(width: 20),
            Text("Accessories : ${controller.eventAssignmentModel.value!.pointAssignments![index].pointRemarks!}"),
          ],
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text ("Index")),
            DataColumn(label: Text("Designation")),
            DataColumn(label: Text("Buckle Number")),
            DataColumn(label: Text("Police Name")),
            DataColumn(label: Text("District")),
            DataColumn(label: Text("Police Station Name")),
            DataColumn(label: Text("Age")),
            DataColumn(label: Text("Gender")),
            DataColumn(label: Text("Number")),
            DataColumn(label: Text("Duty Starting Date")),
            DataColumn(label: Text("Duty Ending Date")),
          ],
          rows: controller.eventAssignmentModel.value?.pointAssignments![index].assignedPoliceList!
              .asMap()
              .map((index4, police) => MapEntry(
              index4,
              DataRow(cells: [
                DataCell(Text((index4+1).toString())),
                DataCell(Text(police.designation ?? '')),
                DataCell(Text(police.buckleNumber ?? '')),
                DataCell(Text(police.policeName ?? '')),
                DataCell(Text(police.district ?? '')),
                DataCell(Text(police.policeStationName ?? '')),
                DataCell(Text(police.age ?? '')),
                DataCell(Text(police.gender ?? '')),
                DataCell(Text(police.number ?? '')),
                DataCell(Text(police.dutyStartDate ?? '')),
                DataCell(Text(police.dutyEndDate ?? '')),
              ])
          ))
              .values
              .toList() ?? const [],
        ),
      ],
    );
  }


  Widget eventSelectionDropDownWidget() {
    return  Container(
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

  Widget showAssignmentButton() {
    return ElevatedButton(
        onPressed: controller.showAssignments,
        child: const Text("Show Assignments"));
  }
}