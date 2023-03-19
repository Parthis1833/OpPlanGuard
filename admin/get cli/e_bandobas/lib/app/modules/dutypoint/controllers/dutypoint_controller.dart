import 'package:e_bandobas/app/Exceptions/custom_exception.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:e_bandobas/app/modules/point-assesment/views/selected_point_assignment_grid.dart';
import 'package:get/get.dart';
import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/Event.dart';
import '../../../jsondata/EventData/EventApi.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountOfAssignedTotalRequestedModel.dart';
import '../../../jsondata/PointData/PointApi.dart';
import '../../../jsondata/PointPoliceCount/PointPoliceCountApi.dart';
import '../../../jsondata/PointPoliceCount/PointPoliceCountAssignmentModel.dart';
import '../../point-assesment/views/PointViewDataGrid.dart';

class DutypointController extends GetxController {
  //TODO: Implement DutypointController
  late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final events = Rxn<List<Event>>();
  final eventAssignmentCounts =
      Rxn<List<EventPoliceCountAssignedTotalRequestedModel>>();
  final pointPoliceAssignments = Rxn<List<PointPoliceCountAssignment>>();

  final selectedPointAssignment = Rxn<PointPoliceCountAssignment>();
  final selectedPointAssignmentDataGridSource =
      Rxn<SelectedPointViewAssignmentDataGridSource>();

  final pointList = Rxn<List<Point>>();
  final pointViewDataGridSource = Rxn<PointViewDataGridSource>();
  final pointViewDataGridCols = ["ID", "Point Name"];
  List<Assignment> designations = <Assignment>[];

  Future<PointViewDataGridSource?> getPointViewDataGridSource() async {
    if (pointPoliceAssignments.value != null) {
      pointViewDataGridSource.value =
          PointViewDataGridSource(pointPoliceAssignments.value!);
      return pointViewDataGridSource.value;
    }
    // return PointViewDataGridSource([]);
    return null;
  }

  Future<SelectedPointViewAssignmentDataGridSource?>
      getCreateUpdatePointAssignmentDataGridSource() async {
    if (selectedPointAssignment.value != null) {
      selectedPointAssignmentDataGridSource.value =
          SelectedPointViewAssignmentDataGridSource(
              [selectedPointAssignment.value!]);
      return selectedPointAssignmentDataGridSource.value;
    }
    return null;
    // return SelectedPointViewAssignmentDataGridSource([]);
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    getEventAssignments();
    loadPointAssignmentCount();
    update();
  }

  void changeSelectedPoint(num? value) {
    selectedPointId.value = value!.toInt();
    loadSelectedPointAssignmentCount();
    loadDesignationFromAssignments();
    selectedPointAssignmentDataGridSource.value =
        SelectedPointViewAssignmentDataGridSource(
            [selectedPointAssignment.value!]);
    update();
  }

  void getEventAssignments() async {
    eventAssignmentCounts.value =
        await EventPoliceCountAPI.obtainEventPoliceCountAssignments(
            API_Decision.Only_Failure, selectedEventId.value);
  }

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.isNotEmpty) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
      getEventAssignments();
    }
    update();
  }

  Future<void> loadPointAssignmentCount() async {
    if (events.value != null) {
      pointPoliceAssignments.value =
          await PointPoliceCountApi.obtainEntireEventAssignments(
              API_Decision.Only_Failure, selectedEventId.value);
      if (pointPoliceAssignments.value != null) {
        if (pointPoliceAssignments.value!.length > 0) {
          selectedPointAssignment.value = pointPoliceAssignments.value![0];
          selectedPointAssignmentDataGridSource.value =
              SelectedPointViewAssignmentDataGridSource(
                  [selectedPointAssignment.value!]);
          pointViewDataGridSource.value =
              PointViewDataGridSource(pointPoliceAssignments.value!);
        } else {
          loadSelectedPointAssignmentCount();
        }
        loadDesignationFromAssignments();
      }
    }
    selectedPointAssignmentDataGridSource.refresh();
    pointViewDataGridSource.refresh();
    update();
  }

  void loadSelectedPointAssignmentCount() async {
    if (selectedEventId.value != null && selectedPointId.value != null) {
      selectedPointAssignment.value =
          await PointPoliceCountApi.obtainPointPoliceAssignments(
              API_Decision.Only_Failure,
              selectedEventId.value,
              selectedPointId.value);

      selectedPointAssignment.value!.pointName = pointList.value!
          .firstWhere((element) => element.id == selectedPointId.value)
          .pointName;

      selectedPointAssignmentDataGridSource.value =
          SelectedPointViewAssignmentDataGridSource(
              [selectedPointAssignment.value!]);
      selectedPointAssignmentDataGridSource.refresh();
      loadDesignationFromAssignments();
      update();
    }
  }

  void loadPoints() async {
    pointList.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (pointList.value != null && pointList.value!.isNotEmpty) {
      selectedPointId.value = pointList.value!.elementAt(0).id!.toInt();
      await loadPointAssignmentCount();
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadEvents();
    loadPoints();
    loadDesignationFromAssignments();
  }

  void loadDesignationFromAssignments() {
    if (selectedPointAssignment.value != null) {
      // designations = pointPoliceAssignments.value![0].assignments!;
      designations = selectedPointAssignment.value!.assignments!;
      pointViewDataGridCols.clear();
      pointViewDataGridCols.addAll(["ID", "Point Name"]);
      pointViewDataGridCols
          .addAll(designations.map((d) => d.designationName ?? ""));
    }
    print(pointViewDataGridCols);
  }

  void updateAssignments(PointPoliceCountAssignment assignment) {
    selectedPointAssignment.value = assignment;
    update();
  }

  void savePointAssignment() async {
    if (selectedPointAssignment.value != null) {
      bool result = await PointPoliceCountApi.saveUpdatePointAssignment(
          API_Decision.Only_Failure, selectedPointAssignment.value);
      // if (!result) {
      //   throw new CustomException("Operation could not be executed");
      // }
      
    }
    // add in list and reduce in policev2 list andreload data source
    // pointPoliceAssignments.value =
    //     pointPoliceAssignments.value!.map((assignment) {
    //   return assignment.pointId == selectedPointAssignment.value!.pointId
    //       ? selectedPointAssignment.value!
    //       : assignment;
    // }).toList();
    bool isExists = false;
    for (int i = 0; i < pointPoliceAssignments.value!.length; i++) {
      if (pointPoliceAssignments.value![i].pointId ==
          selectedPointAssignment.value!.pointId) {
        pointPoliceAssignments.value![i] = selectedPointAssignment.value!;
        isExists = true;
      }
    }
    if (!isExists) {
      pointPoliceAssignments.value!.add(selectedPointAssignment.value!);
    }
    print(pointPoliceAssignments.value!.length);
    getEventAssignments();
    pointViewDataGridSource.value =
        PointViewDataGridSource(pointPoliceAssignments.value!);
    pointPoliceAssignments.refresh();
    pointViewDataGridSource.refresh();
    update();
  }
}
