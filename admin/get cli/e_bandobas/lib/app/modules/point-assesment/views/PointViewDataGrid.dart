import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../jsondata/PointPoliceCount/PointPoliceCountAssignmentModel.dart';
import '../../dutypoint/controllers/dutypoint_controller.dart';

class PointViewDataGridSource extends DataGridSource {
  PointViewDataGridSource(this.assignments) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  final List<PointPoliceCountAssignment> assignments;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      ...mapIndexed(
          row.getCells(),
          (index, item) => Container(
            alignment: Alignment.center,
                child: Text(
                  row.getCells()[index].value.toString(),
                ),
              )),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
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
                  value: assignments[index].pointName ?? ""),
              ...assignments[index].assignments!.map(
                (assignment) => DataGridCell<int>(
                    columnName: assignment.designationName ?? "",
                    value: assignment.designationCount),
              )
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
