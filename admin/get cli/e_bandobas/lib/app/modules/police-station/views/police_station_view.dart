import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../jsondata/PoliceStation/PoliceStationModel.dart';
import '../controllers/police_station_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
                  Get.toNamed(Routes.POLICE_STATION_CREATE);
                },
                child: Text("+ add police station")),
          ],
        ),
        body: Obx(() => controller.policeStations.value == null ?
          const CircularProgressIndicator.adaptive()
          : policeStationListWidget()));
  }

  Widget policeStationListWidget() {
    return FutureBuilder<dynamic>(
        future: getPoliceStationDataSource(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? ListView(
                  children: [
                    SizedBox(
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
                  ],
                )
              : const CircularProgressIndicator.adaptive();
        });
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          allowFiltering: false,
          columnName: 'ID',
          width: 60,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text('ID',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'Station Name',
          width: 170,
          label: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 15.0),
              alignment: Alignment.center,
              child: const Text('Station Name',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'Name in Guj',
          width: 170,
          label: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 15.0),
              alignment: Alignment.center,
              child: const Text('Name in Guj',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),

      GridColumn(
          allowFiltering: false,
          columnName: 'City/District',
          width: 250,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('City/District',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'City in Guj',
          width: 150,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('City in Guj',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Number',
          width: 160,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Number',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'Address',
          width: 160,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Address',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Taluko',
          width: 170,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Taluko',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Taluko in Guj',
          width: 60,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Taluko in Guj',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
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
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[4].value,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[5].value,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[6].value,
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[7].value.toString(),
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[8].value,
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
