import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../Widgets/Buttons/assessmentbutton.dart';
import '../../../resource/card/PoliceCardV2.dart';
import '../controllers/assesment_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class AssesmentView extends GetView<AssesmentController> {
  const AssesmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('Assesment View'),
        centerTitle: true,
        actions: [
          Obx(() => controller.events.value == null
              ? const CircularProgressIndicator.adaptive()
              : eventSelectionDropDownWidget()),
          ElevatedButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
      body: ListView(
        children: [
          Obx(() => controller.eventAssignmentCounts.value == null
              ? const CircularProgressIndicator.adaptive()
              : PoliceCardV2(
              eventAssignments: controller.eventAssignmentCounts.value!)),
         Obx(() => controller.eventDataSource.value  != null
              ? const CircularProgressIndicator.adaptive():
              eventDataSource())
        ],
      ),
      floatingActionButton: assementButton(),
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
  Widget eventDataSource(){
    return FutureBuilder(
      future: controller.getEventViewDataGridSource(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? Column(
          children: [
            SizedBox(
              height:750,
              child: SfDataGridTheme(
                data: SfDataGridThemeData(
                    headerColor: Colors.lightBlueAccent),
                child: SfDataGrid(
                  source: snapshot.data,
                  selectionMode: SelectionMode.multiple,
                  onQueryRowHeight: (details) {
                    return details
                        .getIntrinsicRowHeight(details.rowIndex);
                  },
                  columnWidthMode: ColumnWidthMode.auto,
                  shrinkWrapColumns: true,
                  columns: getColumns(),
                ),
              ),
            ),
          ],
        )
            : const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        );
      },
    );
  }

  Widget assementButton() {
    return SizedBox(
      height: 100,
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AssesmentButton(),
                const Text("Event page")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: const Text("Event Assement"),
                  backgroundColor: const Color.fromARGB(100, 28, 54, 105),
                  onPressed: () {
                    CustomRouteManager.ASSESMENT_CREATE();
                  },
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.deepPurple,
                    size: 56.4,
                  ),
                ),
                const Text("Event Assement")
              ],
            ),
          ),
        ],
      ),
    );
  }
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          allowSorting: false,
          columnName: 'Event-Id',
          width: 70,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text('ID',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowSorting: false,
          columnName: 'Event-Name',
          width: 200,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text('Event-Name',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowSorting: false,
          columnName: 'Event-Details',
          width: 200,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text('Event-Details',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Event-Start-Date',
          width: 200,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text('Event-Start-Date',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Event-End-Date',
          width: 200,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text('Event-End-Date',
                  overflow: TextOverflow.clip, softWrap: true))),
    ];
  }
}