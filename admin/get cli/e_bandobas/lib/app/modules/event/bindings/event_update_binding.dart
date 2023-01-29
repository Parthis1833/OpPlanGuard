import 'package:get/get.dart';

import '../controllers/event_update_controller.dart';

class EventUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventUpdateController>(
      () => EventUpdateController(),
    );
  }
}
