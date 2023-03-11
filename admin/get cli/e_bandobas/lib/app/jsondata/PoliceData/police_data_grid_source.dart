
import 'package:e_bandobas/app/jsondata/PoliceData/police_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PoliceGridSource extends DataGridSource {
  PoliceGridSource(this.contentList) {
    buildDataGridRow();
  }

  late List<DataGridRow> dataGridRows;
  late List<PoliceModel> contentList;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    return DataGridRowAdapter(cells: [
      ...mapIndexed(
        row.getCells(),
        (index, item) => Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            row.getCells()[index].value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    print(contentList.length);
    dataGridRows = mapIndexed(
        contentList,
        (index, police) => DataGridRow(cells: [
              DataGridCell<num>(columnName: 'ID', value: index + 1),
              DataGridCell<String>(columnName: 'Name', value: police.fullName),
              DataGridCell<String>(
                  columnName: 'Designation', value: police.designationName),
              DataGridCell<String>(
                  columnName: 'Buckle number', value: police.buckleNumber),
              DataGridCell<String>(columnName: 'Number', value: police.number),
              DataGridCell<String>(
                  columnName: 'Age', value: police.age.toString()),
              DataGridCell<String>(
                  columnName: 'District', value: police.district),
              DataGridCell<String>(columnName: 'Gender', value: police.gender),
              DataGridCell<String>(
                  columnName: 'Station', value: police.policeStationName),
              DataGridCell<Widget>(
                  columnName: 'Operations',
                  value: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete_forever)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.edit)),
                      ),
                    ],
                  )),
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
