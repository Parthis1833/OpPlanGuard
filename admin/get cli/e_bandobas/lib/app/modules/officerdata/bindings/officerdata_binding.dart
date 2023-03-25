import 'package:get/get.dart';

import '../controllers/officerdata_controller.dart';

class OfficerdataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfficerdataController>(
      () => OfficerdataController(),
    );
  }
}
