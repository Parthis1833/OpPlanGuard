import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/EventPointAssignmentData/eventPointAssignmentApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:get/get.dart';
import '../../../jsondata/EventPointAssignmentData/eventAssignmentModel.dart';

class AssignedPoliceByEventController extends GetxController {
  late final selectedEventId = 0.obs;
  final events = Rxn<List<Event>>();
  final eventAssignmentModel = Rxn<EventAssignmentModel>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }

  void increment() => count.value++;

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

  showAssignments() async {
    eventAssignmentModel.value =
        await EventPointAssignmentModelApi.obtainEventWiseAssignments(
            API_Decision.BOTH, selectedEventId.value);
    update();
  }
}
