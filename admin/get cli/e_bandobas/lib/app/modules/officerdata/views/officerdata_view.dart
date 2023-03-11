import 'package:e_bandobas/app/jsondata/officersdata/OfficersDataGrid.dart';
import 'package:e_bandobas/app/resource/card/PoliceCard.dart';
import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../jsondata/PoliceData/police_model.dart';
import '../../../resource/card/PoliceCardV2.dart';
import '../controllers/officerdata_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OfficerdataView extends GetView<OfficerdataController> {
  const OfficerdataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('OfficerdataView'),
        centerTitle: true,
        actions: [
          Obx(() => controller.events.value == null
              ? const CircularProgressIndicator.adaptive()
              : eventSelectionDropDownWidget()),
        ],
      ),
      body: Column(
        children: [
          Obx(() => controller.eventAssignmentCounts.value == null
              ? const CircularProgressIndicator.adaptive()
              : PoliceCardV2(
                  eventAssignments: controller.eventAssignmentCounts.value!)),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          //   child: Container(
          //     alignment: Alignment.center,
          //     margin: const EdgeInsets.only(left: 300, right: 300),
          //     child: const OfficerDataGrid(),
          //   ),
          // ),
          Obx(() => controller.policeList.value == null
              ? const CircularProgressIndicator.adaptive()
              : policeListWidget())
          // Obx(() => controller.policeList == null
          // ? const CircularProgressIndicator.adaptive()
          // : policeListWidgetV2())
        ],
      ),
    );
  }

  // Widget policeListWidgetV2() {
  //   return SfDataGrid(
  //       source: controller.getEventPoliceDataSource(), columns: getColumns());
  // }
  
  Widget policeListWidget() {
    return FutureBuilder(
        future: controller.getEventPoliceDataSource(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? Expanded(
                  child: ListView(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 700,
                          child: SfDataGridTheme(
                            data: SfDataGridThemeData(
                                headerColor: Colors.lightBlueAccent),
                            child: SfDataGrid(
                              source: snapshot.data,
                              showCheckboxColumn: true,
                              checkboxShape: const CircleBorder(),
                              allowFiltering: true,
                              selectionMode: SelectionMode.multiple,
                              onQueryRowHeight: (details) {
                                return details.rowIndex == 0 ? 70.0 : 49.0;
                              },
                              columnWidthMode: ColumnWidthMode.auto,
                              shrinkWrapColumns: true,
                              columns: getColumns(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator.adaptive();
        });
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
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          event.eventName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                              fontSize: 18.0),
                        ),
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
    final cols = [
      "ID",
      "Name",
      "Designation",
      "Buckle Number",
      "Number",
      "Age",
      "District",
      "Gender",
      "Station",
      "Operations",
    ];
    return <GridColumn>[
      ...cols.map((col) => GridColumn(
          allowFiltering: false,
          columnName: col,
          // width: 100,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(col,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true)))),
    ];
  }


}
