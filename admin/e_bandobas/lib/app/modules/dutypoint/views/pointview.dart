import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PointDetailViewDataGridSource extends DataGridSource {
  PointDetailViewDataGridSource(this.pointList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Point> pointList;

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
        pointList,
        (index, point) => DataGridRow(cells: [
              DataGridCell<num>(columnName: 'ID', value: index + 1),
              DataGridCell<String>(
                  columnName: 'Zone Name', value: point.zoneName),
              DataGridCell<String>(
                  columnName: 'Point Name', value: point.pointName),
              DataGridCell<String>(
                  columnName: 'Accessories', value: point.accessories),
              DataGridCell<String>(columnName: 'Remarks', value: point.remarks),
            ])).toList(growable: false);
  }
}
