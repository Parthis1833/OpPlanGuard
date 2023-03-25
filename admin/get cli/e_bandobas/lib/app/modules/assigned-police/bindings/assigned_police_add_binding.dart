import 'package:get/get.dart';
import '../controllers/assigned_police_add_controller.dart';

class AssignedPoliceAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedPoliceAddController>(
      () => AssignedPoliceAddController(),
    );
  }
}
