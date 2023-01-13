import 'package:get/get.dart';

import '../controllers/zonelist_controller.dart';

class ZonelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZonelistController>(
      () => ZonelistController(),
    );
  }
}
