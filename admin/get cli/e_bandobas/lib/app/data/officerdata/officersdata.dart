import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';



class OfficerDataGrid extends StatelessWidget {
  late OfficerDataGridSource officerDataGridSource;
  List<Officers> officerslist = [];

  OfficerDataGrid({super.key});

  Future generateProductList() async {
    var response = await http.get(Uri.parse(
        'https://gujarat-police-backend.herokuapp.com/police/'));
    var list = json.decode(response.body).cast<Map<String, dynamic>>();
    officerslist =
    await list.map<Officers>((json) => Officers.fromJson(json)).toList();
    officerDataGridSource = OfficerDataGridSource(officerslist);
    return officerslist;
  }


  List<GridColumn> getColumns(){
    List<GridColumn> columns;
    columns = ([
      GridColumn(
        columnName: 'id',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Id',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'fullName',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Full Name',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'buckleNumber',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Buckle Number',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'number',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Number',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'age',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Age',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'district',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'District',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'gender',
        width: 70,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Gender',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
    ]);
    return columns;
  }
  void initState() {
    initState();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
          future: generateProductList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return snapshot.hasData
                ? SfDataGrid(
                source: officerDataGridSource, columns: getColumns())
                : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          });
  }
}

class Officers {
  factory Officers.fromJson(Map<String, dynamic> json) {
    return Officers(
      id: json['id'],
      fullName: json['fullName'],
      buckleNumber: json['buckleNumber'],
      number : json['number'],
      age:  json['age'],
      district: json['district'],
      gender: json['gender'],
    );
  }
  Officers(
      { required this.id,
        required this.fullName,
        required this.buckleNumber,
        required this.number,
        required this.age,
        required this.district,
        required this.gender,
      });
  final int? id;
  final String? fullName;
  final String? buckleNumber;
  final int? number;
  final int? age;
  final String? district;
  final String? gender;
}
class OfficerDataGridSource extends DataGridSource {
  OfficerDataGridSource(this.officerslist) {
    buildDataGridRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<Officers> officerslist = [];

  void buildDataGridRow() {
    dataGridRows =officerslist.map<DataGridRow>((dataGridRow){
      return  DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'fullName', value: dataGridRow.fullName),
        DataGridCell<String>(columnName: 'buckNumber', value: dataGridRow.buckleNumber),
        DataGridCell<int>(columnName: 'number', value: dataGridRow.number),
        DataGridCell<int>(columnName: 'age', value: dataGridRow.age),
        DataGridCell<String>(columnName: 'district', value: dataGridRow.district),
        DataGridCell<String>(columnName: 'gender', value: dataGridRow.gender)
      ]);
    }).toList(growable: false);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row){
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[4].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[5].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[6].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }

}