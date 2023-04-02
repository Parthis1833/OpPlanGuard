import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class EventViewDataGridSource extends DataGridSource {
  EventViewDataGridSource(this.eventList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Event> eventList;

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
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[4].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
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
        eventList,
            (index, event) => DataGridRow(cells: [
          DataGridCell<num>(columnName: 'ID', value: index + 1),
          DataGridCell<String>(
              columnName: 'Event Name', value: event.eventName),
              DataGridCell<String>(
                  columnName: 'Event-Details', value: event.eventDetails),
              DataGridCell(
                  columnName: 'Start-Date', value: event.eventStartDate),
              DataGridCell(columnName: 'End-Date', value: event.eventEndDate),
        ])).toList(growable: false);
  }
}
