import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PointViewDataGrid extends StatelessWidget {
  const PointViewDataGrid({super.key});
  @override
  Widget build(Object context) {
    return FutureBuilder<Object>(
      future: getPointViewDataGridSource(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? Column(
          children: [
            SizedBox(
              height: 700,
              child: SfDataGridTheme(
                data: SfDataGridThemeData(
                    headerColor:  Colors.lightBlueAccent),
                child: SfDataGrid(

                  source: snapshot.data,
                  showCheckboxColumn: true,
                  checkboxShape: const CircleBorder(),
                  allowFiltering: true,
                  selectionMode: SelectionMode.multiple,
                  onQueryRowHeight: (details) {
                    return details.rowIndex == 0 ? 70.0 : 49.0;
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
  Future<PointViewDataGridSource> getPointViewDataGridSource() async {
    List<Point> pointList = await generatecontentList();
    return PointViewDataGridSource(pointList);
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
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                  ),
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          columnName: 'Point Name',
          width: 170,
          label: Container(
              padding: const EdgeInsets.all(8),
              margin:  const EdgeInsets.only(left:15.0),
              alignment: Alignment.center,
              child: const Text('Point Name',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                  ),
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Accessories',
          width: 250,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Accessories',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                  ),
                  overflow: TextOverflow.clip, softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Remarks',
          width: 150,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Rermarks',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                  ),
                  overflow: TextOverflow.clip, softWrap: true))),
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
  PointViewDataGridSource(this.pointList) {
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
        pointList, (index, point) =>
        DataGridRow(cells: [
        DataGridCell<num>(columnName: 'ID', value: index+1),
        DataGridCell<String>(columnName: 'Point Name', value:point.pointName),
        DataGridCell<String>(columnName: 'Accessories', value: point.accessories),
        DataGridCell<String>(columnName: 'Remarks', value: point.remarks),
      ])
    ).toList(growable: false);

  }
}
