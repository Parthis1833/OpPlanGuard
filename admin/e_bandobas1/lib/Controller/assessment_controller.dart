import 'package:e_bandobas1/routes/app_pages.dart';
import 'package:get/get.dart';

class AssessmentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  navigateToPage(int index) {
    if (index == 0) {
      Get.toNamed(Routes.assessment);
    } else if (index == 1) {
      Get.toNamed(Routes.counter);
    } else if (index == 2) {
      Get.toNamed(Routes.duttPoint);
    } else if (index == 3) {
      Get.toNamed(Routes.duttyPointAllocation);
    } else if (index == 4) {
      Get.toNamed(Routes.officersData);
    } else if (index == 5) {
      Get.toNamed(Routes.roadBandobast);
    } else if (index == 6) {
      Get.toNamed(Routes.settings);
    }
  }
}
