import 'package:e_bandobas/app/Exceptions/ValidationException.dart';
import 'package:e_bandobas/app/jsondata/PoliceData/PoliceIdNameDesigNumbModel.dart';
import 'package:get/get.dart';

import '../../../../constants/enums.dart';
import '../../../jsondata/EventData/Event.dart';
import '../../../jsondata/EventData/EventApi.dart';
import '../../../jsondata/EventPointAssignmentData/eventPointAssignmentModel.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import '../../../jsondata/PointData/Point.dart';
import '../../../jsondata/PointData/PointApi.dart';

class AssignedPoliceAddController extends GetxController {
  //TODO: Implement AssignedPoliceController
  late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final events = Rxn<List<Event>>();
  final points = Rxn<List<Point>>();
  final policeNames = Rxn<List<PoliceIdNameDesigNumb>>();
  List<PoliceIdNameDesigNumb> selectedPolice = [];

  final eventPointAssignmentModel = Rxn<EventPointAssignmentModel>();
  final isAssignmentLoaded = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadEvents();
    loadPoints();
    // loadPolice(); // police will be loaded once when events are loaded completely
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
    loadPolice();
    update();
  }

  void loadPolice({String searchTerm = ''}) async {
    policeNames.value =
        await EventPoliceCountAPI.getUnAssignedPoliceIdNameDesigNumbList(
            API_Decision.Only_Failure, selectedEventId.value, searchTerm);
    update();
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    loadPolice();
    update();
  }

  void changeSelectedPoint(num? value) {
    selectedPointId.value = value!.toInt();
    update();
  }

  Future<List<PoliceIdNameDesigNumb>> getData(String filter) async {
    // var response = await Dio().get(
    //   "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
    //   queryParameters: {"filter": filter},
    // );

    // final data = response.data;
    // if (data != null) {
    //   return UserModel.fromJsonList(data);
    // }
    loadPolice(searchTerm: filter);
    if (policeNames.value != null) {
      return policeNames.value!;
    }
    update();
    return [];
  }

  void clearPolice() {
    policeNames.value = [];
    update();
  }

  void assignPolice() {
    if (selectedPolice.isEmpty) {
      throw ValidationException().showValidationSnackBar();
    }
    
    
  }

  void onChangeSelected(List<PoliceIdNameDesigNumb> selectedPolice) {
    this.selectedPolice = selectedPolice;
  }
}
