import 'package:e_bandobas/app/modules/assigned-police/controllers/assiged_police_view_by_event_controller.dart';
import 'package:get/get.dart';

/**
 * This view will show all the assigned police but will have to select event and assignment for it
 */
class AssignedPoliceByEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignedPoliceByEventController>(
      () => AssignedPoliceByEventController(),
    );
  }
}
