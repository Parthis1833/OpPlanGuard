import 'package:get/get.dart';

import '../controllers/police_insert_controller.dart';

class PoliceInsertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliceInsertController>(
      () => PoliceInsertController(),
    );
  }
}
