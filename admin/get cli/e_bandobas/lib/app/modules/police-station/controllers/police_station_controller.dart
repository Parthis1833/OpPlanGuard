import 'package:e_bandobas/constants/enums.dart';
import 'package:get/get.dart';

import '../../../jsondata/PoliceStation/PoliceStationModel.dart';
import '../../../jsondata/PoliceStation/police_station_api.dart';

class PoliceStationController extends GetxController {
  //TODO: Implement PoliceStationController
  final policeStations = Rxn<List<PoliceStationModel>>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadPoliceStation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void loadPoliceStation() async {
    policeStations.value = await PoliceStationApi.obtainPoliceStationModel(API_Decision.BOTH);
    update();
  }
}
