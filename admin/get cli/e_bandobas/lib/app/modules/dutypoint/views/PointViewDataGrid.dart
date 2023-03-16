import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../jsondata/EventPoliceCount/EventPoliceCountOfAssignedTotalRequestedModel.dart';
import '../../../jsondata/PointPoliceCount/PointPoliceCountAssignmentModel.dart';
import '../controllers/dutypoint_controller.dart';

class PointViewDataGrid extends StatelessWidget {
  final DutypointController pointController = Get.find();

  PointViewDataGrid({super.key});
  @override
  Widget build(Object context) {
    return FutureBuilder(
      future: pointController.getPointViewDataGridSource(),
      // future: getPointViewDataGridSource(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? Column(
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

  // Future<PointViewDataGridSource> getPointViewDataGridSource() async {
  //   List<Point> pointList = await generatecontentList();
  //   return PointViewDataGridSource(pointList);
  // }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      ...pointController.pointViewDataGridCols.map((col) => GridColumn(
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

      // GridColumn(
      //     allowFiltering: false,
      //     columnName: 'ID',
      //     width: 60,
      //     label: Container(
      //         padding: const EdgeInsets.all(8),
      //         alignment: Alignment.centerLeft,
      //         child: const Text('ID',
      //             style: TextStyle(
      //                 fontSize: 16,
      //                 color: Colors.white,
      //                 fontStyle: FontStyle.italic),
      //             overflow: TextOverflow.clip,
      //             softWrap: true))),
      // GridColumn(
      //     columnName: 'Point Name',
      //     width: 370,
      //     label: Container(
      //         padding: const EdgeInsets.all(8),
      //         margin: const EdgeInsets.only(left: 15.0),
      //         alignment: Alignment.center,
      //         child: const Text('Point Name',
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.white,
      //                 fontStyle: FontStyle.italic),
      //             overflow: TextOverflow.clip,
      //             softWrap: true))),
      // GridColumn(
      //     columnName: 'Zone Name',
      //     width: 370,
      //     label: Container(
      //         padding: const EdgeInsets.all(8),
      //         margin: const EdgeInsets.only(left: 15.0),
      //         alignment: Alignment.center,
      //         child: const Text('Point Name',
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.white,
      //                 fontStyle: FontStyle.italic),
      //             overflow: TextOverflow.clip,
      //             softWrap: true))),
      // GridColumn(
      //     allowFiltering: false,
      //     columnName: 'Accessories',
      //     width: 300,
      //     label: Container(
      //         padding: const EdgeInsets.all(8),
      //         alignment: Alignment.center,
      //         child: const Text('Accessories',
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.white,
      //                 fontStyle: FontStyle.italic),
      //             overflow: TextOverflow.clip,
      //             softWrap: true))),
      // GridColumn(
      //     allowFiltering: false,
      //     columnName: 'Remarks',
      //     width: 350,
      //     label: Container(
      //         padding: const EdgeInsets.all(8),
      //         alignment: Alignment.center,
      //         child: const Text('Rermarks',
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.white,
      //                 fontStyle: FontStyle.italic),
      //             overflow: TextOverflow.clip,
      //             softWrap: true))),
    ];
  }

  Future<List<Point>> generatecontentList() async {
    var response = await http.get(Uri.parse(APIConstants.POINT_URL));
    var decodedPoint = jsonDecode(utf8.decode(response.bodyBytes));
    List<Point> pointListFromContent = [];
    if (decodedPoint['content'] != null) {
      decodedPoint['content'].forEach((pointData) {
        pointListFromContent.add(Point.fromJson(pointData));
      });
    }
    pointListFromContent[0];
    return pointListFromContent;
  }
}

class PointViewDataGridSource extends DataGridSource {
  PointViewDataGridSource(this.assignments) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  // late List<Point> pointList;
  final List<PointPoliceCountAssignment> assignments;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    print("row cells size: ${row.getCells().length}");
    return DataGridRowAdapter(cells: [
      ...mapIndexed(
          row.getCells(),
          (index, item) => Container(
                child: Text(
                  row.getCells()[index].value.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
      // Container(
      //   alignment: Alignment.centerLeft,
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text(
      //     row.getCells()[0].value.toString(),
      //     overflow: TextOverflow.ellipsis,
      //   ),
      // ),
      // Container(
      //   alignment: Alignment.center,
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text(
      //     row.getCells()[1].value,
      //     overflow: TextOverflow.ellipsis,
      //   ),
      // ),
      // Container(
      //   alignment: Alignment.center,
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text(
      //     row.getCells()[2].value,
      //   ),
      // ),
      // Container(
      //   alignment: Alignment.center,
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text(
      //     row.getCells()[3].value,
      //   ),
      // ),
      // Container(
      //   alignment: Alignment.center,
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text(
      //     row.getCells()[4].value,
      //   ),
      // ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    // print(assignments.);

    Iterable<E> mapIndexed<E, T>(
        Iterable<T> items, E Function(int index, T item) f) sync* {
      var index = 0;

      for (final item in items) {
        yield f(index, item);
        index = index + 1;
      }
    }

    dataGridRows = mapIndexed(
        assignments,
        (index, designation) => DataGridRow(cells: [
              DataGridCell<num>(columnName: 'ID', value: index + 1),
              DataGridCell<String>(
                  columnName: 'Point Name',
                  value: assignments[index].pointName ?? "wtf"),
              // DataGridCell<String>(
              //     columnName: 'Zone Name', value: point.zoneName),
              // DataGridCell<String>(
              //     columnName: 'Accessories', value: point.accessories),
              // DataGridCell<String>(columnName: 'Remarks', value: point.remarks),
              // ...assignments.assignments!.map(
              //   (d) => DataGridCell<int>(
              //       columnName: d.designationName ?? "",
              //       value: designation.designationCount),
              ...assignments[index].assignments!.map(
                (assignment) => DataGridCell<int>(
                    columnName:
                        assignment.designationName ?? "",
                    value: assignment.designationCount),
              )
            ])).toList(growable: false);
    print("datagridrow size : ${dataGridRows[0].getCells().length}");
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
