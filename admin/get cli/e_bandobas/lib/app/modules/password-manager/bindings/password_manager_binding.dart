import 'package:get/get.dart';

import '../controllers/password_manager_controller.dart';

class PasswordManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordManagerController>(
      () => PasswordManagerController(),
    );
  }
}
