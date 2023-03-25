import 'package:get/get.dart';

import '../controllers/assigned_police_delete_controller.dart';

class AssignedPoliceDeleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedPoliceDeleteController>(
      () => AssignedPoliceDeleteController(),
    );
  }
}
