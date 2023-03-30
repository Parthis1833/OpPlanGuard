import 'package:get/get.dart';

import '../controllers/police_create_controller.dart';
import '../controllers/police_station_controller.dart';

class PoliceCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliceCreateController>(
      () => PoliceCreateController(),
    );
  }
}
