import 'package:get/get.dart';

import '../controllers/assesment_controller.dart';

class AssesmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssesmentController>(
      () => AssesmentController(),
    );
  }
}
