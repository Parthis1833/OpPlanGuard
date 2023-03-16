import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../jsondata/PointPoliceCount/PointPoliceCountAssignmentModel.dart';
import '../controllers/dutypoint_controller.dart';

class SelectedPointViewAssignmentDataGridSource extends DataGridSource {
  SelectedPointViewAssignmentDataGridSource(this.assignments) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  final List<PointPoliceCountAssignment> assignments;
  final DutypointController controller = Get.find();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      ...mapIndexed(
          row.getCells(),
          (index, item) => 
          index == 1 ?
          Obx(() => controller.selectedPointId.value == null ?
          const CircularProgressIndicator.adaptive()
          : pointSelectionDropDownWidget())
          : Container(
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

  Widget pointSelectionDropDownWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            height: 55,
            width: 350,
            child: DropdownButton(
                value: controller.selectedPointId.value,
                isExpanded: true,
                itemHeight: 60,
                items: controller.pointList.value!.map((point) {
                  return DropdownMenuItem(
                    value: point.id, child: Text(point.pointName.toString() ,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                        fontSize: 24.0),),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.changeSelectedPoint(value);
                }),
          ),
        ],
      ),
    );
  }
}
