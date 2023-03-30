import 'package:get/get.dart';

import '../controllers/police_station_controller.dart';

class PoliceStationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliceStationController>(
      () => PoliceStationController(),
    );
  }
}
