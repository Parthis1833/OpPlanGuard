import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../Api/models/Police/Officers.dart';

class OfficersDataSouce extends DataGridSource{

  OfficersDataSouce({required List<Police>polices}){
    dataGridRows = polices
        .map<DataGridRow>((dataGridRow) =>DataGridRow(cells: [
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
    ]))
        .toList();
  }
  List<DataGridRow> dataGridRows = [];

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              alignment: (dataGridCell.columnName == 'ID' ||
                  dataGridCell.columnName == 'Gender')
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }
  
}