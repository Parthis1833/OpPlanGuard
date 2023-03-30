import 'package:get/get.dart';

import '../controllers/police_station_create_controller.dart';

class PoliceStationCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliceStationCreateController>(
      () => PoliceStationCreateController(),
    );
  }
}
