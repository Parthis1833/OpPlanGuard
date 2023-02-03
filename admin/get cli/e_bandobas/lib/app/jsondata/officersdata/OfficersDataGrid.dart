import 'package:e_bandobas/app/Api/models/Police/Officers.dart';
import 'package:e_bandobas/app/Api/API.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OfficerDataGrid extends StatelessWidget {
  const OfficerDataGrid({super.key});

  @override
  Widget build(Object context) {
    return FutureBuilder<Object>(
      future: getOfficersDataSource(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? Column(
          children: [
                SizedBox(
                  height: 700,
                  child: SfDataGrid(
                  source: snapshot.data,
                      showCheckboxColumn: true,
                      checkboxShape: CircleBorder(),
                      allowFiltering: true,
                      selectionMode: SelectionMode.multiple,
                      onQueryRowHeight: (details) {
                        return details.rowIndex == 0 ? 70.0 : 49.0;
                      },
                      shrinkWrapColumns: true,
                  columns: getColumns(),
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
  Future<OffficerDataGridSource> getOfficersDataSource() async {
    List<Police> contentList = await generatecontentList();
    return OffficerDataGridSource(contentList);
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
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Designation',
          width: 170,
          label: Container(
              padding: const EdgeInsets.all(8),
              margin:  const EdgeInsets.only(left:15.0),
              alignment: Alignment.center,
              child: const Text('Designation',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Officers Name',
          width: 250,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Officers Name',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Buckle Number',
          width: 150,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Buckle Number',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Number',
          width: 160,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Number',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Police Station ',
          width: 160,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Police Station',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Distric',
          width: 170,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Distric',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Age',
          width: 60,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Age',
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Gender',
          width:75 ,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Gender',
                  overflow: TextOverflow.clip, softWrap: true)))
    ];
  }
  Future<List<Police>> generatecontentList() async {
    var response = await http.get(Uri.parse(APIConstants.POLICE_URL));
    var decodedOfficerss = jsonDecode(utf8.decode(response.bodyBytes));
    List<Police> policeListFromContent = [];
    if (decodedOfficerss['content'] != null) {
      decodedOfficerss['content'].forEach((policeData) {
        policeListFromContent.add(Police.fromJson(policeData));
      });
    }
    policeListFromContent[0];
    return policeListFromContent;
  }
}
class OffficerDataGridSource extends DataGridSource {
  OffficerDataGridSource(this.contentList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Police> contentList;

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
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow() {
    dataGridRows = contentList.map<DataGridRow>((dataGridRow) {
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
