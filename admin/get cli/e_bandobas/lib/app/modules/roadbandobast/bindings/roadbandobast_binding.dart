import 'package:get/get.dart';

import '../controllers/roadbandobast_controller.dart';

class RoadbandobastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoadbandobastController>(
      () => RoadbandobastController(),
    );
  }
}
