import 'package:get_storage/get_storage.dart';

class LocalStorage{
  static void setUserName(String value) => GetStorage().write('user-name', value);
  static void setPhoneNumber(String value) => GetStorage().write('phone-number', value);

  static String? getUserName() => GetStorage().read('user-name');
  static String? getPhoneNumber() => GetStorage().read('phone-number');
}