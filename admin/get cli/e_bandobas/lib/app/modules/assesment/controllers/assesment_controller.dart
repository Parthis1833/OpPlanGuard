import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:get/get.dart';

class AssesmentController extends GetxController {
  //TODO: Implement AssesmentController

  final count = 0.obs;
  @override
  void onClose() {}
  navigateToPage(int index) {
    if (index == 0) {
      Get.toNamed(Routes.ASSESMENT);
    } else if (index == 1) {
      Get.toNamed(Routes.COUNTER);
    } else if (index == 2) {
      Get.toNamed(Routes.DUTYPOINT);
    } else if (index == 3) {
      Get.toNamed(Routes.POINTLIST);
    } else if (index == 4) {
      Get.toNamed(Routes.ZONELIST);
    } else if (index == 5) {
      Get.toNamed(Routes.DUTYPOINTALLOCATION);
    } else if (index == 6) {
      Get.toNamed(Routes.OFFICERDATA);
    } else if (index == 7) {
      Get.toNamed(Routes.ROADBANDOBAST);
    } else if (index == 8) {
      Get.toNamed(Routes.SETTING);
    }
  }

}
