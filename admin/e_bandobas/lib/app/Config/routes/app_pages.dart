import 'package:get/get.dart';

import '../../modules/assesment-create/bindings/assesment_create_binding.dart';
import '../../modules/assesment-create/views/assesment_create_view.dart';
import '../../modules/assesment/bindings/assesment_binding.dart';
import '../../modules/assesment/views/assesment_view.dart';
import '../../modules/assigned-police/bindings/assiged_police_view_by_event_binding.dart';
import '../../modules/assigned-police/bindings/assigned_police_add_binding.dart';
import '../../modules/assigned-police/bindings/assigned_police_binding.dart';
import '../../modules/assigned-police/bindings/assigned_police_delete_binding.dart';
import '../../modules/assigned-police/bindings/assigned_police_update_binding.dart';
import '../../modules/assigned-police/views/assiged_police_view_by_event.dart';
import '../../modules/assigned-police/views/assigned_police_add.dart';
import '../../modules/assigned-police/views/assigned_police_delete.dart';
import '../../modules/assigned-police/views/assigned_police_update.dart';
import '../../modules/assigned-police/views/assigned_police_view.dart';
import '../../modules/designation-view/bindings/designation_view_binding.dart';
import '../../modules/designation-view/views/designation_view_view.dart';
import '../../modules/dutypoint/bindings/dutypoint_binding.dart';
import '../../modules/dutypoint/views/dutypoint_view.dart';
import '../../modules/dutypointallocation/bindings/dutypointallocation_binding.dart';
import '../../modules/dutypointallocation/views/dutypointallocation_view.dart';
import '../../modules/event/bindings/event_create_binding.dart';
import '../../modules/event/bindings/event_update_binding.dart';
import '../../modules/event/views/event_create.dart';
import '../../modules/event/views/event_update.dart';
import '../../modules/officerdata/bindings/officerdata_binding.dart';
import '../../modules/officerdata/views/officerdata_view.dart';
import '../../modules/point-assesment/bindings/point_assesment_binding.dart';
import '../../modules/point-assesment/views/point_assesment_view.dart';
import '../../modules/point-police-assement/bindings/show_point_assignment_binding.dart';
import '../../modules/point-police-assement/views/show_point_assignments.dart';
import '../../modules/police-station/bindings/police_create_bindings.dart';
import '../../modules/police-station/bindings/police_station_binding.dart';
import '../../modules/police-station/bindings/police_station_create_binding.dart';
import '../../modules/police-station/views/police_create.dart';
import '../../modules/police-station/views/police_station_create.dart';
import '../../modules/police-station/views/police_station_view.dart';
import '../../modules/roadbandobast/bindings/roadbandobast_binding.dart';
import '../../modules/roadbandobast/views/roadbandobast_view.dart';
import '../../modules/setting/bindings/setting_binding.dart';
import '../../modules/setting/views/setting_view.dart';

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
      name: PATHS.PointAssesment,
      page: () => const PointAssesmentView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: PATHS.DUTYPOINT,
      page: () => const DutypointView(),
      binding: DutypointBinding(),
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
      page: () => const AssesmentCreateView(),
      binding: AssesmentCreateBinding(),
    ),
    GetPage(
      name: PATHS.SHOW_POINTS_ASSESMENT,
      page: () => const ShowPointAssigment(),
      binding: ShowPointPoliceAssementBinding(),
    ),
    GetPage(
      name: PATHS.EVENT_CREATE,
      page: () => EventCreateView(),
      binding: EventCreateBinding(),
    ),
    GetPage(
      name: PATHS.EVENT_UPDATE,
      page: () => const EventUpdateView(),
      binding: EventUpdateBinding(),
    ),
    GetPage(
      name: Routes.ASSIGNED_POLICE,
      page: () => const AssignedPoliceView(),
      binding: AssignedPoliceBinding(),
    ),
    GetPage(
      name: PATHS.ASSIGNED_POLICE_ADD,
      page: () => AssignedPoliceAddView(),
      binding: AssignedPoliceAddBinding(),
    ),
    GetPage(
      name: Routes.ASSIGNED_POLICE_DELETE,
      page: () => const AssignedPoliceDeleteView(),
      binding: AssignedPoliceDeleteBinding(),
    ),
    GetPage(
      name: Routes.ASSIGNED_POLICE_UPDATE,
      page: () => const AssignedPoliceUpdateView(),
      binding: AssignedPoliceUpdateBinding(),
    ),
    GetPage(
        name: Routes.ASSIGNED_POLICE_VIEW_BY_EVENT,
        page: () => AssignedPoliceByEventView(),
        binding: AssignedPoliceByEventBinding()),
    GetPage(
      name: Routes.POLICE_STATION,
      page: () => PoliceStationView(),
      binding: PoliceStationBinding(),
    ),
    GetPage(
      name: Routes.POLICE_STATION_CREATE,
      page: () => PoliceStationCreateView(),
      binding: PoliceStationCreateBinding(),
    ),
    GetPage(
      name: Routes.POLICE_CREATE,
      page: () => PoliceCreateView(),
      binding: PoliceCreateBinding(),
    ),
    GetPage(
      name: Routes.DESIGNATION_VIEW,
      page: () => const DesignationViewView(),
      binding: DesignationViewBinding(),
    ),
  ];
}
