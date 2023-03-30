import 'package:get/get.dart';

import '../controllers/dutypointallocation_controller.dart';

class DutypointallocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DutypointallocationController>(
      () => DutypointallocationController(),
    );
  }
}
