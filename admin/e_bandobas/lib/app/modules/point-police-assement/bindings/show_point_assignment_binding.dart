import 'package:get/get.dart';
import '../controllers/show_point_assignment_controller.dart';

class ShowPointPoliceAssementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPointPoliceAssementController>(
      () => ShowPointPoliceAssementController(),
    );
  }
}
