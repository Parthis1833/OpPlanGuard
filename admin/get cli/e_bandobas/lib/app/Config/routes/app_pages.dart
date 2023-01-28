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
import '../../modules/point-police-assement/bindings/show_point_assignment_binding.dart';
import '../../modules/point-police-assement/views/point_police_assement_view.dart';
import '../../modules/pointlist/bindings/pointlist_binding.dart';
import '../../modules/pointlist/views/pointlist_view.dart';
import '../../modules/roadbandobast/bindings/roadbandobast_binding.dart';
import '../../modules/roadbandobast/views/roadbandobast_view.dart';
import '../../modules/setting/bindings/setting_binding.dart';
import '../../modules/setting/views/setting_view.dart';
import '../../modules/zonelist/bindings/zonelist_binding.dart';
import '../../modules/zonelist/views/zonelist_view.dart';
import '../../modules/point-police-assement/views/show_point_assignments.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.ASSESMENT;

  static final routes = [
    GetPage(
      name: PATHS.ASSESMENT,
      page: () => const AssesmentView(),
      binding: AssesmentBinding(),
    ),
    GetPage(
      name: PATHS.COUNTER,
      page: () => const CounterView(),
    ),
    GetPage(
      name: PATHS.DUTYPOINT,
      page: () => const DutypointView(),
      binding: DutypointBinding(),
    ),
    GetPage(
      name: PATHS.POINTLIST,
      page: () => const PointlistView(),
      binding: PointlistBinding(),
    ),
    GetPage(
      name: PATHS.ZONELIST,
      page: () => const ZonelistView(),
      binding: ZonelistBinding(),
      children: [
        GetPage(
          name: PATHS.ZONELIST,
          page: () => const ZonelistView(),
          binding: ZonelistBinding(),
        ),
      ],
    ),
    GetPage(
      name: PATHS.DUTYPOINTALLOCATION,
      page: () => const DutypointallocationView(),
      binding: DutypointallocationBinding(),
    ),
    GetPage(
      name: PATHS.OFFICERDATA,
      page: () => OfficerdataView(),
      binding: OfficerdataBinding(),
    ),
    GetPage(
      name: PATHS.ROADBANDOBAST,
      page: () => const RoadbandobastView(),
      binding: RoadbandobastBinding(),
    ),
    GetPage(
      name: PATHS.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: PATHS.ASSESMENT_CREATE,
      page: () => AssesmentCreateView(),
      binding: AssesmentCreateBinding(),
    ),
    GetPage(
      name: PATHS.POINT_POLICE_ASSESMENET,
      page: () => const PointPoliceAssementView(),
      binding: PointPoliceAssementBinding(),
    ),
    GetPage(
      name: PATHS.SHOW_POINTS_ASSESMENT,
      page: () => const ShowPointAssigment(),
      binding: ShowPointPoliceAssementBinding(),
    ),
  ];
}
