import 'package:get/get.dart';

import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/Event.dart';
import '../../../jsondata/EventData/EventApi.dart';
import '../../../jsondata/EventPointAssignmentData/eventPointAssignmentApi.dart';
import '../../../jsondata/EventPointAssignmentData/eventPointAssignmentModel.dart';
import '../../../jsondata/PointData/Point.dart';
import '../../../jsondata/PointData/PointApi.dart';

class AssignedPoliceAddController extends GetxController {
  //TODO: Implement AssignedPoliceController
late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final events = Rxn<List<Event>>();
  final points = Rxn<List<Point>>();
  final eventPointAssignmentModel = Rxn<EventPointAssignmentModel>();
  final isAssignmentLoaded = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadEvents();
    loadPoints();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void loadPoints() async {
    print("done");
    points.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (points.value != null && points.value!.length > 0) {
      selectedPointId.value = points.value!.elementAt(0).id!.toInt();
    }
    // points.value!.forEach((element) {
    //   print(element.id);
    //   print(element.pointName);
    // });
    // print(points.value![0].pointName);
    update();
  }

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    update();
  }

  void changeSelectedPoint(num? value) {
    selectedPointId.value = value!.toInt();
    update();
  }

  
}
