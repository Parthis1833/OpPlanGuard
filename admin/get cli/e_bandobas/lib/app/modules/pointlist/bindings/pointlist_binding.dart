import 'package:get/get.dart';

import '../controllers/pointlist_controller.dart';

class PointlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointlistController>(
      () => PointlistController(),
    );
  }
}
