import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:e_bandobas/app/modules/assigned-police/controllers/assiged_police_view_by_event_controller.dart';
import 'package:e_bandobas/app/modules/assigned-police/controllers/assigned_police_add_controller.dart';
import 'package:e_bandobas/app/modules/assigned-police/controllers/assigned_police_controller.dart';
import 'package:e_bandobas/app/modules/assigned-police/controllers/assigned_police_delete_controller.dart';
import 'package:e_bandobas/app/modules/assigned-police/controllers/assigned_police_update_controller.dart';
import 'package:e_bandobas/app/modules/designation-view/controllers/designation_view_controller.dart';
import 'package:e_bandobas/app/modules/dutypoint/controllers/dutypoint_controller.dart';
import 'package:e_bandobas/app/modules/dutypointallocation/controllers/dutypointallocation_controller.dart';
import 'package:e_bandobas/app/modules/event/controllers/event_controller.dart';
import 'package:e_bandobas/app/modules/event/controllers/event_create_controller.dart';
import 'package:e_bandobas/app/modules/event/controllers/event_update_controller.dart';
import 'package:e_bandobas/app/modules/officerdata/controllers/officerdata_controller.dart';
import 'package:e_bandobas/app/modules/point-police-assement/controllers/show_point_assignment_controller.dart';
import 'package:e_bandobas/app/modules/police-station/controllers/police_create_controller.dart';
import 'package:e_bandobas/app/modules/police-station/controllers/police_station_controller.dart';
import 'package:e_bandobas/app/modules/roadbandobast/controllers/roadbandobast_controller.dart';
import 'package:e_bandobas/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';
import 'modules/assesment-create/controllers/assesment_create_controller.dart';
import 'modules/assesment/controllers/assesment_controller.dart';
import 'modules/point-assesment/controllers/point_assesment_controller.dart';
import 'modules/police-station/controllers/police_station_create_controller.dart';

class CustomRouteManager {
  static void ASSESMENT({arguments}) {
    Get.delete<AssesmentController>();
    Get.toNamed(Routes.ASSESMENT, arguments: arguments);
  }
  static void ASSESMENT_CREATE({arguments}) {
    Get.delete<AssesmentCreateController>();
    Get.toNamed(Routes.ASSESMENT_CREATE, arguments: arguments);
  }
  static void ASSIGNED_POLICE({arguments}) {
    Get.delete<AssignedPoliceController>();
    Get.toNamed(Routes.ASSIGNED_POLICE, arguments: arguments);
  }
  static void ASSIGNED_POLICE_ADD({arguments}) {
    Get.delete<AssignedPoliceAddController>();
    Get.toNamed(Routes.ASSIGNED_POLICE_ADD, arguments: arguments);
  }
  static void ASSIGNED_POLICE_DELETE({arguments}) {
    Get.delete<AssignedPoliceDeleteController>();
    Get.toNamed(Routes.ASSIGNED_POLICE_DELETE, arguments: arguments);
  }
  static void ASSIGNED_POLICE_UPDATE({arguments}) {
    Get.delete<AssignedPoliceUpdateController>();
    Get.toNamed(Routes.ASSIGNED_POLICE_UPDATE, arguments: arguments);
  }
  static void ASSIGNED_POLICE_VIEW_BY_EVENT({arguments}) {
    Get.delete<AssignedPoliceByEventController>();
    Get.toNamed(Routes.ASSIGNED_POLICE_VIEW_BY_EVENT, arguments: arguments);
  }
  static void PointAssesment({arguments}) {
    Get.delete<PointAssesmentController>();
    Get.toNamed(Routes.PointAssesment, arguments: arguments);
  }
  static void DUTYPOINT({arguments}) {
    Get.delete<DutypointController>();
    Get.toNamed(Routes.DUTYPOINT, arguments: arguments);
  }
  static void DUTYPOINTALLOCATION({arguments}) {
    Get.delete<DutypointallocationController>();
    Get.toNamed(Routes.DUTYPOINTALLOCATION, arguments: arguments);
  }
  static void EVENT_SHOW({arguments}) {
    Get.delete<EventController>();
    Get.toNamed(Routes.EVENT_SHOW, arguments: arguments);
  }
  static void EVENT_CREATE({arguments}) {
    Get.delete<EventCreateController>();
    Get.toNamed(Routes.EVENT_CREATE, arguments: arguments);
  }
  static void EVENT_UPDATE({arguments}) {
    Get.delete<EventUpdateController>();
    Get.toNamed(Routes.EVENT_UPDATE, arguments: arguments);
  }
  static void OFFICERDATA({arguments}) {
    Get.delete<OfficerdataController>();
    Get.toNamed(Routes.OFFICERDATA, arguments: arguments);
  }
  static void POLICE_CREATE({arguments}) {
    Get.delete<PoliceCreateController>();
    Get.toNamed(Routes.POLICE_CREATE, arguments: arguments);
  }
  static void POLICE_STATION({arguments}) {
    Get.delete<PoliceStationController>();
    Get.toNamed(Routes.POLICE_STATION, arguments: arguments);
  }
  static void POLICE_STATION_CREATE({arguments}) {
    Get.delete<PoliceStationCreateController>();
    Get.toNamed(Routes.POLICE_STATION_CREATE, arguments: arguments);
  }

  static void ROADBANDOBAST({arguments}) {
    Get.delete<RoadbandobastController>();
    Get.toNamed(Routes.ROADBANDOBAST, arguments: arguments);
  }
  static void SETTING({arguments}) {
    Get.delete<SettingController>();
    Get.toNamed(Routes.SETTING, arguments: arguments);
  }
  static void SHOW_POINTS_ASSESMENT({arguments}) {
    Get.delete<ShowPointPoliceAssementController>();
    Get.toNamed(Routes.SHOW_POINTS_ASSESMENT, arguments: arguments);
  }
  static void DESIGNATION_VIEW({arguments}) {
    Get.delete<DesignationViewController>();
    Get.toNamed(Routes.DESIGNATION_VIEW, arguments: arguments);
  }
}
