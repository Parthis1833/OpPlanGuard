import 'package:e_bandobas/app/jsondata/officersdata/temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class Officertable extends StatelessWidget{
  const Officertable({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SfDataGrid(
        columns: getColumns(),
        source:OfficersDataSouce(polices: []),
    );
  }
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
            child:
            const Text('', overflow: TextOverflow.clip, softWrap: true))),

  ];
}
