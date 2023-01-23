import 'package:get/get.dart';

import '../controllers/dutypoint_controller.dart';

class DutypointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DutypointController>(
      () => DutypointController(),
    );
  }
}
