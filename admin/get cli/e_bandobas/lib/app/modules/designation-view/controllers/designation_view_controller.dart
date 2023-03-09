import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:get/get.dart';

import '../../../jsondata/DesignationData/DesignationApi.dart';

class DesignationViewController extends GetxController {
  //TODO: Implement DesignationViewController

  final designations = Rxn<List<Designation>>();
  @override
  void onInit() {
    super.onInit();
    loadDesignations();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadDesignations() async {
    designations.value =
        await DesignationApi.obtainDesignations(API_Decision.BOTH);
  }
}
