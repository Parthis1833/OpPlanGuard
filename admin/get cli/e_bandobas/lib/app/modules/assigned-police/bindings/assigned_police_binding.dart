import 'package:get/get.dart';
import '../controllers/assigned_police_controller.dart';

/**
 * This view will show all the assigned police but will have to select event and assignment for it
 */
class AssignedPoliceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedPoliceController>(
      () => AssignedPoliceController(),
    );
  }
}
