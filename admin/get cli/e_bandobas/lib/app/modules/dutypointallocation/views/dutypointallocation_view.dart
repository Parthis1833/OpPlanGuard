import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dutypointallocation_controller.dart';

class DutypointallocationView extends GetView<DutypointallocationController> {
  const DutypointallocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('DutypointallocationView'),
        centerTitle: true,
      ),
      body: Obx(() => (controller.events.value == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator.adaptive(strokeWidth: 5.0),
              ],
            ) : assesmentDataWidget()),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: const Text("Assigned Police"),
                backgroundColor: Colors.lightGreen,
                onPressed: () {
                  CustomRouteManager.ASSIGNED_POLICE();
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.deepPurple,
                  size: 56.4,
                ),
              ),
              const Text("Assigned Page")
            ],
          )),
    );
  }

  Widget assesmentDataWidget() {
    return ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          eventSelectionDropDownWidget(),
          showAssignmentButton(),
          downloadExcelWidgetButton(),
        ],
      ),
      displayEventAssignment(),
    ]);
  }

  Widget displayEventAssignment() {
    return Obx(() => controller.eventAssignmentModel.value == null
        ? const SizedBox()
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
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) => pointLevelAssignment(index),
        separatorBuilder: (_, index) => const Divider(),
        itemCount: controller.eventAssignmentModel.value!.pointAssignments!.length);
  }

  Widget pointLevelAssignment(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DataTable(
          columns: const [
            DataColumn(label: Text("Zone")),
            DataColumn(label: Text("Point")),
            DataColumn(label: Text("Designation")),
            DataColumn(label: Text("Buckle Number")),
            DataColumn(label: Text("Police Name")),
            DataColumn(label: Text("District")),
            DataColumn(label: Text("Police Station Name")),
            DataColumn(label: Text("Age")),
            DataColumn(label: Text("Gender")),
            DataColumn(label: Text("Number")),
            DataColumn(label: Text("Accessories")),
            DataColumn(label: Text("Remarks"))
          ],
          rows: controller.eventAssignmentModel.value?.pointAssignments![index]
                  .assignedPoliceList!
                  .asMap()
                  .map((index4, police) => MapEntry(
                      index4,
                      DataRow(cells: [
                        DataCell(Text(controller.eventAssignmentModel.value!.pointAssignments![index].zoneName!)),
                        DataCell(Text(controller.eventAssignmentModel.value!.pointAssignments![index].pointName!)),
                        DataCell(Text(police.designation ?? '')),
                        DataCell(Text(police.buckleNumber ?? '')),
                        DataCell(Text(police.policeName ?? '')),
                        DataCell(Text(police.district ?? '')),
                        DataCell(Text(police.policeStationName ?? '')),
                        DataCell(Text(police.age ?? '')),
                        DataCell(Text(police.gender ?? '')),
                        DataCell(Text(police.number ?? '')),
                        DataCell(Text(controller.eventAssignmentModel.value!.pointAssignments![index].pointAccessories!)),
                        DataCell(Text(controller.eventAssignmentModel.value!.pointAssignments![index].pointRemarks!)),
                      ])))
                  .values
                  .toList() ??
              const [],
        ),
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
            'સોંપણીનું નામ  :-',
            style: TextStyle(
                fontWeight: FontWeight.w600,
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

  Widget showAssignmentButton() {
    return ElevatedButton(
        onPressed: controller.showAssignments,
        child: const Text("Show Assignments"));
  }

  Widget downloadExcelWidgetButton() {
    return Obx(() => controller.eventAssignmentModel.value == null
        ? const SizedBox()
        : ElevatedButton(
            onPressed: controller.downloadExcel,
            child: const Text("View in Excel")));
  }
}
