import 'dart:convert';
import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:e_bandobas/app/Widgets/Buttons/assessmentbutton.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../controllers/event_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';


class EventView extends GetView<EventController> {
  const EventView({Key? key}) : super(key: key);
  Future<List<Event>> generatecontentList() async{
    var response = await http.get(Uri.parse(
      // 'http://gujaratpolicebackend-env.eba-bpbkpxau.us-east-1.elasticbeanstalk.com/police/'
        APIConstants.EVENT_URL)
    );
    var decodedOfficerss = jsonDecode(utf8.decode(response.bodyBytes));
    List<Event> policeListFromContent = [];
    if (decodedOfficerss['content'] != null) {
      decodedOfficerss['content'].forEach((EventData) {
        policeListFromContent.add(Event.fromJson(EventData));
      });
    }
    policeListFromContent[0];
    return policeListFromContent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventView'),
        centerTitle: true,
      ),
      body: Obx(() => (controller.events.value != null &&
          controller.events.value!.isEmpty)
          ? const CircularProgressIndicator()
          : Center(child: eventsPageData())),
      floatingActionButton: AssesmentButton(),
    );
  }

  Widget createEventButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: const Text("Create Event"),
              backgroundColor: const Color.fromARGB(100, 28, 54, 105),
              onPressed: () {
                Get.toNamed(PATHS.EVENT_CREATE);
              },
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.deepPurple,
                size: 56.4,
              ),
            ),
            const Text("Create Event")
          ],
        ),
      ),
    ]);
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
  Widget eventsPageData() {
    return  FutureBuilder<Object>(
      future: getEventDataSource(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData ? Column(
        children: [
        SizedBox(
        height: 700,
        child: SfDataGridTheme(
        data: SfDataGridThemeData(
        headerColor:  Colors.lightBlueAccent),
        child: SfDataGrid(
        source: snapshot.data,
        showCheckboxColumn: true,
        checkboxShape: const CircleBorder(),
        allowSorting: true,
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
  Future<EventDataGridSource>getEventDataSource() async {
    List<Event> eventList = await generatecontentList();
    return  EventDataGridSource(eventList);
  }
}
class EventDataGridSource extends DataGridSource{
  late List<DataGridRow> dataGridRows;
  late List<Event> eventList;
  EventDataGridSource(this.eventList){
    buildDataGridRow();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[4].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]
    );
  }
  @override
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow() {
    dataGridRows = eventList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<num>(columnName: 'Event-ID', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'Event-Name', value: dataGridRow.eventName),
        DataGridCell<String>(columnName: 'Event-Details', value: dataGridRow.eventDetails),
        DataGridCell(columnName: 'Start-Date', value: dataGridRow.eventStartDate),
        DataGridCell(columnName: 'End-Date', value: dataGridRow.eventEndDate),
      ]);

    }).toList(growable: false);
  }
}