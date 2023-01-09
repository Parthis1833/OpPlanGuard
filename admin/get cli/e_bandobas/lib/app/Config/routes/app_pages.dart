import 'package:e_bandobas/app/modules/assesment/bindings/assesment_binding.dart';
import 'package:e_bandobas/app/modules/assesment/views/assesment_view.dart';
import 'package:e_bandobas/app/modules/counter/views/counter_view.dart';
import 'package:e_bandobas/app/modules/dutypoint/bindings/dutypoint_binding.dart';
import 'package:e_bandobas/app/modules/dutypoint/views/dutypoint_view.dart';
import 'package:e_bandobas/app/modules/dutypointallocation/bindings/dutypointallocation_binding.dart';
import 'package:e_bandobas/app/modules/dutypointallocation/views/dutypointallocation_view.dart';
import 'package:e_bandobas/app/modules/officerdata/bindings/officerdata_binding.dart';
import 'package:e_bandobas/app/modules/officerdata/views/officerdata_view.dart';
import 'package:e_bandobas/app/modules/pointlist/bindings/pointlist_binding.dart';
import 'package:e_bandobas/app/modules/pointlist/views/pointlist_view.dart';
import 'package:e_bandobas/app/modules/roadbandobast/bindings/roadbandobast_binding.dart';
import 'package:e_bandobas/app/modules/roadbandobast/views/roadbandobast_view.dart';
import 'package:e_bandobas/app/modules/setting/bindings/setting_binding.dart';
import 'package:e_bandobas/app/modules/setting/views/setting_view.dart';
import 'package:e_bandobas/app/modules/zonelist/bindings/zonelist_binding.dart';
import 'package:e_bandobas/app/modules/zonelist/views/zonelist_view.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.ASSESMENT;

  static final routes = [
    GetPage(
      name: _Paths.ASSESMENT,
      page: () => const AssesmentView(),
      binding: AssesmentBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => const CounterView(),
    ),
    GetPage(
      name: _Paths.DUTYPOINT,
      page: () => const DutypointView(),
      binding: DutypointBinding(),
    ),
    GetPage(
      name: _Paths.POINTLIST,
      page: () => const PointlistView(),
      binding: PointlistBinding(),
    ),
    GetPage(
      name: _Paths.ZONELIST,
      page: () => const ZonelistView(),
      binding: ZonelistBinding(),
      children: [
        GetPage(
          name: _Paths.ZONELIST,
          page: () => const ZonelistView(),
          binding: ZonelistBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.DUTYPOINTALLOCATION,
      page: () => const DutypointallocationView(),
      binding: DutypointallocationBinding(),
    ),
    GetPage(
      name: _Paths.OFFICERDATA,
      page: () =>  OfficerdataView(),
      binding: OfficerdataBinding(),
    ),
    GetPage(
      name: _Paths.ROADBANDOBAST,
      page: () => const RoadbandobastView(),
      binding: RoadbandobastBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
