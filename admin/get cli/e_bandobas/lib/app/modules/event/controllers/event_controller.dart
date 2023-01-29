import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  //TODO: Implement EventController
  final events = Rxn<List<Event>>();
  late final selectedEventId = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }
  
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  
  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }
}
