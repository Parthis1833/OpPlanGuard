import 'package:get/get.dart';

import '../controllers/event_create_controller.dart';

class EventCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventCreateController>(
      () => EventCreateController(),
    );
  }
}
