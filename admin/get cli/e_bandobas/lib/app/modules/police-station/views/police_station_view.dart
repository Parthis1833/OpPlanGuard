import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../jsondata/PoliceStation/PoliceStationModel.dart';
import '../controllers/police_station_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PoliceStationView extends GetView<PoliceStationController> {
  const PoliceStationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PoliceStationView'),
          centerTitle: true,
          actions: [
            ElevatedButton(
                onPressed: () {
                  CustomRouteManager.POLICE_STATION_CREATE();
                },
                child: Text("+ add police station")),
          ],
        ),
        body: Obx(() => controller.policeStations.value == null
            ? const CircularProgressIndicator.adaptive()
            : policeStationListWidget()));
  }

  Widget policeStationListWidget() {
    return FutureBuilder<dynamic>(
        future: getPoliceStationDataSource(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? ListView(
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
                )
              : const CircularProgressIndicator.adaptive();
        });
  }

  List<GridColumn> getColumns() {
    final cols = [
      "ID",
      "Station Name",
      "Name in Guj",
      "City/ District",
      "City in Guj",
      "Number",
      "Address",
      "Taluko",
      "Taluko in Guj"
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

  Future<PoliceStationGridSource> getPoliceStationDataSource() async {
    List<PoliceStationModel> contentList = [];
    if (controller.policeStations.value != null) {
      contentList = controller.policeStations.value!;
      print("assigned ${contentList.length}");
    }
    return PoliceStationGridSource(contentList);
  }
}

class PoliceStationGridSource extends DataGridSource {
  PoliceStationGridSource(this.contentList) {
    buildDataGridRow();
  }

  late List<DataGridRow> dataGridRows;
  late List<PoliceStationModel> contentList;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    return DataGridRowAdapter(cells: [
      ...mapIndexed(
        row.getCells(),
        (index, item) => Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            row.getCells()[index].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    print(contentList.length);
    dataGridRows = mapIndexed(
        contentList,
        (index, policeStation) => DataGridRow(cells: [
              DataGridCell<num>(columnName: 'ID', value: index + 1),
              DataGridCell<String>(
                  columnName: 'Station Name',
                  value: policeStation.policeStationName),
              DataGridCell<String>(
                  columnName: 'Name in Guj',
                  value: policeStation.policeStationNameInGujarati),
              DataGridCell<String>(
                  columnName: 'City/District', value: policeStation.district),
              DataGridCell<String>(
                  columnName: 'City in Guj',
                  value: policeStation.districtInGuj),
              DataGridCell<String>(
                  columnName: 'Number', value: policeStation.contactNumber),
              DataGridCell<String>(
                  columnName: 'Address', value: policeStation.address),
              DataGridCell<String>(
                  columnName: 'taluko', value: policeStation.taluko),
              DataGridCell<String>(
                  columnName: 'taluko in Guj',
                  value: policeStation.talukoInGuj),
            ])).toList(growable: false);
  }

  Iterable<E> mapIndexed<E, T>(
      Iterable<T> items, E Function(int index, T item) f) sync* {
    var index = 0;

    for (final item in items) {
      yield f(index, item);
      index = index + 1;
    }
  }
}