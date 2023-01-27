import 'package:get/get.dart';

import '../../modules/assesment-create/bindings/assesment_create_binding.dart';
import '../../modules/assesment-create/views/assesment_create_view.dart';
import '../../modules/assesment/bindings/assesment_binding.dart';
import '../../modules/assesment/views/assesment_view.dart';
import '../../modules/counter/views/counter_view.dart';
import '../../modules/dutypoint/bindings/dutypoint_binding.dart';
import '../../modules/dutypoint/views/dutypoint_view.dart';
import '../../modules/dutypointallocation/bindings/dutypointallocation_binding.dart';
import '../../modules/dutypointallocation/views/dutypointallocation_view.dart';
import '../../modules/officerdata/bindings/officerdata_binding.dart';
import '../../modules/officerdata/views/officerdata_view.dart';
import '../../modules/point-police-assement/bindings/point_police_assement_binding.dart';
import '../../modules/point-police-assement/views/point_police_assement_view.dart';
import '../../modules/pointlist/bindings/pointlist_binding.dart';
import '../../modules/pointlist/views/pointlist_view.dart';
import '../../modules/roadbandobast/bindings/roadbandobast_binding.dart';
import '../../modules/roadbandobast/views/roadbandobast_view.dart';
import '../../modules/setting/bindings/setting_binding.dart';
import '../../modules/setting/views/setting_view.dart';
import '../../modules/zonelist/bindings/zonelist_binding.dart';
import '../../modules/zonelist/views/zonelist_view.dart';

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
      page: () => OfficerdataView(),
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
    GetPage(
      name: _Paths.ASSESMENT_CREATE,
      page: () => AssesmentCreateView(),
      binding: AssesmentCreateBinding(),
    ),
    GetPage(
      name: _Paths.POINT_POLICE_ASSEMENT,
      page: () => const PointPoliceAssementView(),
      binding: PointPoliceAssementBinding(),
    ),
  ];
}
