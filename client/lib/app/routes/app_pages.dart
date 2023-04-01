import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/police-insert/bindings/police_insert_binding.dart';
import '../modules/police-insert/views/police_insert_view.dart';
import '../modules/user-detail/bindings/user_detail_binding.dart';
import '../modules/user-detail/views/user_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.USER_DETAIL;
  

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER_DETAIL,
      page: () => UserDetailView(),
      binding: UserDetailBinding(),
    ),
    GetPage(
      name: _Paths.POLICE_INSERT,
      page: () => PoliceInsertView(),
      binding: PoliceInsertBinding(),
    ),
  ];
}
