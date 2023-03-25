import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';

import '../../../../constants/enums.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountAPI.dart';
import '../../../jsondata/EventPoliceCount/EventPoliceCountOfAssignedTotalRequestedModel.dart';

class AssesmentController extends GetxController {
  late final selectedEventId = 0.obs;
  final events = Rxn<List<Event>>();
  final eventAssignmentCounts =
      Rxn<List<EventPoliceCountAssignedTotalRequestedModel>>();

  final count = 0.obs;
  @override
  void onClose() {}

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.isNotEmpty) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
      getEventAssignments();
    }
    print(events.value);
    update();
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    getEventAssignments();
    update();
  }

  void getEventAssignments() async {
    eventAssignmentCounts.value =
        await EventPoliceCountAPI.obtainEventPoliceCountAssignments(
            API_Decision.Only_Failure, selectedEventId.value);
  }

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }
}
