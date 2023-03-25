import 'package:get/get.dart';
import '../controllers/assigned_police_update_controller.dart';

class AssignedPoliceUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedPoliceUpdateController>(
      () => AssignedPoliceUpdateController(),
    );
  }
}
