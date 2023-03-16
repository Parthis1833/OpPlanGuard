import 'package:e_bandobas/app/resource/button/collapsebutton.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../resource/card/PoliceCardV2.dart';
import '../controllers/dutypoint_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DutypointView extends GetView<DutypointController> {
  const DutypointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('DutypointView'),
        centerTitle: true,
        actions: [
          Obx(() => controller.events.value == null
              ? const CircularProgressIndicator.adaptive()
              : eventSelectionDropDownWidget()),
        ],
      ),
      body: ListView(
        children: [
          Obx(() => controller.eventAssignmentCounts.value == null
              ? const CircularProgressIndicator.adaptive()
              : PoliceCardV2(
                  eventAssignments: controller.eventAssignmentCounts.value!)),
          Obx(() => controller.pointList.value == null &&
                  controller.pointPoliceAssignments.value == null
              ? const CircularProgressIndicator.adaptive()
              : pointGridWidget())
        ],
      ),
      floatingActionButton: const CollapseButton(),
    );
  }

  Widget pointGridWidget() {
    return FutureBuilder(
      future: controller.getPointViewDataGridSource(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                      headerColor: Colors.lightBlueAccent),
                  child: SfDataGrid(
                    source: snapshot.data,
                   
                    columns: getColumns(),
                  ),
                ),
              ),
            )
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              );
      },
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
                      child: Text(
                        event.eventName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                            fontSize: 18.0),
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

  List<GridColumn> getColumns() {
    return <GridColumn>[
      ...controller.pointViewDataGridCols.map((col) => GridColumn(
          columnName: col,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(col,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))))
    ];
  }
}
