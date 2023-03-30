import 'package:get/get.dart';

import '../controllers/assesment_create_controller.dart';

class AssesmentCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssesmentCreateController>(
      () => AssesmentCreateController(),
    );
  }
}
