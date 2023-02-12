import 'package:get/get.dart';
import '../controllers/point_police_assement_controller.dart';

class PointPoliceAssementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointPoliceAssementController>(
      () => PointPoliceAssementController(),
    );
  }
}
