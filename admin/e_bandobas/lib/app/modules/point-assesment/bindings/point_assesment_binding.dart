import 'package:get/get.dart';

import '../controllers/point_assesment_controller.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointAssesmentController>(
      () => PointAssesmentController(),
    );
  }
}
