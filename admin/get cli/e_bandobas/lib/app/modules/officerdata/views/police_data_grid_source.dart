import 'package:e_bandobas/app/jsondata/PoliceData/police_model.dart';
import 'package:e_bandobas/app/modules/officerdata/controllers/officerdata_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PoliceGridSource extends DataGridSource {
  PoliceGridSource(this.contentList) {
    buildDataGridRow();
  }

  final OfficerdataController controller =
      Get.find(); // retrieve the controller instance

  final cols = [
    "ID",
    "Name",
    "Designation",
    "Buckle Number",
    "Number",
    "Age",
    "District",
    "Gender",
    "Station",
    "Operations",
  ];

  late List<DataGridRow> dataGridRows;
  late List<PoliceModel> contentList;

  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
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
    // print(newCellValue + " " + oldValue);
    rowColumnIndex.columnIndex -= 1;

    if (column.columnName == 'ID') {
      // keeping it as uneditable id should not be changed
    } else if (column.columnName == 'Name') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Name', value: newCellValue);
      print("name");
      contentList[dataRowIndex].fullName = newCellValue.toString();
    } else if (column.columnName == 'Designation') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Designation', value: newCellValue);
      print("designation");
      contentList[dataRowIndex].designationName = newCellValue.toString();
    } else if (column.columnName == 'Buckle Number') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: 'Buckle Number', value: newCellValue);
      print("buckle");
      contentList[dataRowIndex].buckleNumber = newCellValue.toString();
    } else if (column.columnName == 'Number') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Number', value: newCellValue);
      print("Number");
      contentList[dataRowIndex].number = newCellValue.toString();
    } else if (column.columnName == 'Age') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'Age', value: newCellValue);
      print("age");
      contentList[dataRowIndex].age = newCellValue;
    } else if (column.columnName == 'District') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'District', value: newCellValue);
      print("district");
      contentList[dataRowIndex].district = newCellValue.toString();
    } else if (column.columnName == 'Station') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Station', value: newCellValue);
      print("station");

      contentList[dataRowIndex].policeStationName = newCellValue.toString();
    } else {
    }

    controller.updateContentListRow(contentList[dataRowIndex]);
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    /**
     * 9th index is bool value which using to show delete button
     * if we want to add/remove cols change this value
     */
    return DataGridRowAdapter(cells: [
      ...mapIndexed(
        row.getCells(),
        (index, item) => Container(
          height: 280,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: index == cols.length - 1
              ? row.getCells()[9].value == false
              ? IconButton(
            onPressed: () {
              Get.defaultDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.deletePoliceById(row.getCells()[0].value);
                        Get.back();
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          )
              : Container()
              : Text(
            row.getCells()[index].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        )
      )
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = mapIndexed(
        contentList,
        (index, police) => DataGridRow(cells: [
              DataGridCell<num>(columnName: 'ID', value: index + 1),
              DataGridCell<String>(columnName: 'Name', value: police.fullName),
              DataGridCell<String>(
                  columnName: 'Designation', value: police.designationName),
              DataGridCell<String>(
                  columnName: 'Buckle Number', value: police.buckleNumber),
              DataGridCell<String>(columnName: 'Number', value: police.number),
              DataGridCell<String>(
                  columnName: 'Age', value: police.age.toString()),
              DataGridCell<String>(
                  columnName: 'District', value: police.district),
              DataGridCell<String>(columnName: 'Gender', value: police.gender),
              DataGridCell<String>(
                  columnName: 'Station', value: police.policeStationName),
              DataGridCell<bool>(
                  columnName: 'Operations', value: police.isAssigned),
            ])).toList(growable: false);
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';
    newCellValue = null;

    final bool isNumericType =
        column.columnName == 'ID' || column.columnName == 'Age';

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

  Iterable<E> mapIndexed<E, T>(
      Iterable<T> items, E Function(int index, T item) f) sync* {
    var index = 0;
    for (final item in items) {
      yield f(index, item);
      index = index + 1;
    }
  }
}
