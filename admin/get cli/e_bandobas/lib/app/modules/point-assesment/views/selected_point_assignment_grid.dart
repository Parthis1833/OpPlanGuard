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
import '../controllers/point_assesment_controller.dart';

class SelectedPointViewAssignmentDataGridSource extends DataGridSource {
  SelectedPointViewAssignmentDataGridSource(this.assignments) {
    buildDataGridRow();
  }
  dynamic newCellValue;

  TextEditingController editingController = TextEditingController();
  late List<DataGridRow> dataGridRows;
  final List<PointPoliceCountAssignment> assignments;
  // final DutypointController controller = Get.find();
  final PointAssesmentController controller = Get.find();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      ...mapIndexed(
          row.getCells(),
          (index, item) => index == 1
              ? Obx(() => controller.selectedPointId.value == null
                  ? const CircularProgressIndicator.adaptive()
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
            height: 45,
            width: 150,
            child: DropdownButton(
                value: controller.selectedPointId.value,
                isExpanded: true,
                itemHeight: 50,
                items: controller.pointList.value!.map((point) {
                  return DropdownMenuItem(
                    value: point.id,
                    child: Text(
                      point.pointName.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                          fontSize: 18.0),
                    ),
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

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value ??
        '';
    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    print("oldvalue & new value = $oldValue : $newCellValue");
    // rowColumnIndex.columnIndex -= 2;
    print(rowColumnIndex.columnIndex);
    print(
        "${dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex].columnName} : ${dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex].value} : ${rowColumnIndex.columnIndex}");
    dataGridRows[dataRowIndex].getCells().forEach((rowCell) {
      if (rowCell.columnName == column.columnName) {
        print("my name is sheela");
        dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
            DataGridCell<String>(
                columnName: rowCell.columnName, value: newCellValue);
        assignments[dataRowIndex]
            .assignments![rowColumnIndex.columnIndex - 2]
            .designationCount = int.tryParse(newCellValue);
      }
    });
    controller.updateAssignments(assignments[dataRowIndex]);
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    final bool isNumericType =
        column.columnName == 'id' || column.columnName == 'salary';

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: isNumericType ? Alignment.centerRight : Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: isNumericType ? TextAlign.right : TextAlign.left,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
        ),
        keyboardType: isNumericType ? TextInputType.number : TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (isNumericType) {
              newCellValue = int.parse(value);
            } else {
              newCellValue = value;
            }
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          submitCell();
        },
      ),
    );
  }
}
