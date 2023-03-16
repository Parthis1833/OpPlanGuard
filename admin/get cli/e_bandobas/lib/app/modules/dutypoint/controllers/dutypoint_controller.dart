import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:get/get.dart';
import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/Event.dart';
import '../../../jsondata/EventData/EventApi.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountOfAssignedTotalRequestedModel.dart';
import '../../../jsondata/PointData/PointApi.dart';
import '../../../jsondata/PointPoliceCount/PointPoliceCountApi.dart';
import '../../../jsondata/PointPoliceCount/PointPoliceCountAssignmentModel.dart';
import '../views/PointViewDataGrid.dart';

class DutypointController extends GetxController {
  //TODO: Implement DutypointController
  late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final events = Rxn<List<Event>>();
  final eventAssignmentCounts = Rxn<List<EventPoliceCountAssignedTotalRequestedModel>>();
  final pointPoliceAssignments = Rxn<List<PointPoliceCountAssignment>>();
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
    return PointViewDataGridSource(pointPoliceAssignments.value!);
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    getEventAssignments();
    update();
  }

  void changeSelectedPoint(num? value) {
    selectedPointId.value = value!.toInt();
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

  void loadPointAssignmentCount() async {
    if (events.value != null) {
      pointPoliceAssignments.value =
          await PointPoliceCountApi.obtainEntireEventAssignments(
              API_Decision.Only_Failure, selectedEventId.value);
      if (pointPoliceAssignments.value != null) {
        loadDesignationFromAssignments();
      }
    }
    update();
  }

  void loadPoints() async {
    pointList.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (pointList.value != null && pointList.value!.isNotEmpty) {
      selectedPointId.value = pointList.value!.elementAt(0).id!.toInt();
      loadPointAssignmentCount();
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
    if (pointPoliceAssignments.value != null) {
      designations = pointPoliceAssignments.value![0].assignments!;
      pointViewDataGridCols
          .addAll(designations.map((d) => d.designationName ?? ""));
    }
  }
}
