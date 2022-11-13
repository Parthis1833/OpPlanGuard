import 'dart:ffi';

import 'package:e_bandobas/app/jsondata/officersdata/Officers.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class OfficerDataGrid extends StatelessWidget {
  @override
  Widget build(Object context) {
    return FutureBuilder<Object>(
      future: getOfficersDataSource(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData? SfDataGrid(source: snapshot.data, columns: getColumns()) : const Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        );
      },
    );
  }

  Future<OffficerDataGridSource> getOfficersDataSource() async {
    var officersList = await generateOfficersList();
    return OffficerDataGridSource(officersList);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'ID',
          width: 50,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: const Text('ID',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Designation',
          width: 100,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Designation',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Officers Name',
          width: 250,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Officers Name',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Buckle Number',
          width: 65,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Buckle Number',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Number',
          width: 150,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Number',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Police Station ',
          width: 150,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Police Station',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Distric',
          width: 150,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Distric',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Age',
          width: 50,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Age',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Gender',
          width: 65,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Gender',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: '',
          width: 50,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('',
                  overflow: TextOverflow.clip, softWrap: true))),
    ];
  }

  Future<List<Officers>> generateOfficersList() async {
    var response = await http
        .get(Uri.parse('https://gujarat-police-backend.herokuapp.com/police/'));
    var decodedOfficerss =
    json.decode(response.body).cast<Map<String, dynamic>>();
    List<Officers> officersList = await decodedOfficerss
        .map<Officers>((json) => Officers.fromJson(json))
        .toList();
    return officersList;
  }
}

class OffficerDataGridSource extends DataGridSource {
  OffficerDataGridSource(this.officersList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Officers> officersList;

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
      Container(
        margin: const EdgeInsets.all(4),
        child: RawMaterialButton(
          onPressed: () {},
          elevation: 8.0,
          fillColor: Colors.lightBlue,
          padding: const EdgeInsets.all(5.0),
          child: const Icon(
            Icons.delete_forever_outlined,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      )
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = officersList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<num>(columnName: 'ID', value: dataGridRow.id),
        DataGridCell<String>(
            columnName: 'Designation', value: dataGridRow.designation?.name),
        DataGridCell<String>(
            columnName: 'fullName', value: dataGridRow.fullName),
        DataGridCell<String>(
            columnName: 'BuckleNumber', value: dataGridRow.buckleNumber),
        DataGridCell<String>(columnName: 'Number', value: dataGridRow.number),
        DataGridCell<String>(
            columnName: 'Police Station',
            value: dataGridRow.policeStation?.policeStationName),
        DataGridCell<String>(
            columnName: 'District', value: dataGridRow.policeStation?.district),
        DataGridCell<num>(columnName: 'Age', value: dataGridRow.age),
        DataGridCell<String>(columnName: 'Gender', value: dataGridRow.gender),
      ]);
    }).toList(growable: false);
  }
}
