import 'package:get/get.dart';

import '../controllers/designation_view_controller.dart';

class DesignationViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesignationViewController>(
      () => DesignationViewController(),
    );
  }
}
