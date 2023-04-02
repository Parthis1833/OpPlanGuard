import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../Widgets/Buttons/collapsebutton.dart';
import '../../../resource/drawer/navigation_drawer.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../controllers/dutypoint_controller.dart';

class DutypointView extends GetView<DutypointController> {
  const DutypointView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('DutypointView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(() => controller.pointDataSource.value == null
              ? const CircularProgressIndicator.adaptive()
              : pointDataGridWidget()),
        ],
      ),
      floatingActionButton: const CollapseButton(),
    );
  }

  Widget pointDataGridWidget() {
    return FutureBuilder(
      future: controller.getPointViewDataGridSource(),
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
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'Zone Name',
          width: 370,
          label: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 15.0),
              alignment: Alignment.center,
              child: const Text('Zone Name',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          columnName: 'Point Name',
          width: 370,
          label: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 15.0),
              alignment: Alignment.center,
              child: const Text('Point Name',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Accessories',
          width: 300,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Accessories',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
      GridColumn(
          allowFiltering: false,
          columnName: 'Remarks',
          width: 350,
          label: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: const Text('Rermarks',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.clip,
                  softWrap: true))),
    ];
  }
}
