import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gujarat_police_client_side/app/Exceptions/ValidationException.dart';
import 'package:gujarat_police_client_side/app/holders/get_storage.dart';

class UserDetailController extends GetxController {
  //TODO: Implement UserDetailController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool createUserNameInStorage(String userName, String phoneNumber) {
    if (userName.isEmpty || phoneNumber.isEmpty) {
      throw ValidationException("Some Fields are required").validationSnackBar;
    } else {
      return true;
    }
  }
}
