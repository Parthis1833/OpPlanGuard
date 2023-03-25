part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ASSESMENT = PATHS.ASSESMENT;
  static const PointAssesment = PATHS.PointAssesment;
  static const DUTYPOINT = PATHS.DUTYPOINT;
  static const POINTLIST = PATHS.POINTLIST;
  static const ZONELIST = PATHS.ZONELIST;
  static const DUTYPOINTALLOCATION = PATHS.DUTYPOINTALLOCATION;
  static const OFFICERDATA = PATHS.OFFICERDATA;
  static const ROADBANDOBAST = PATHS.ROADBANDOBAST;
  static const SETTING = PATHS.SETTING;
  static const ASSESMENT_CREATE = PATHS.ASSESMENT_CREATE;
  static const SHOW_POINTS_ASSESMENT = PATHS.SHOW_POINTS_ASSESMENT;

  static const EVENT_SHOW = PATHS.EVENT_SHOW;
  static const EVENT_CREATE = PATHS.EVENT_CREATE;
  static const EVENT_UPDATE = PATHS.EVENT_UPDATE;

  static const ASSIGNED_POLICE = PATHS.ASSIGNED_POLICE;
  static const ASSIGNED_POLICE_ADD = PATHS.ASSIGNED_POLICE_ADD;
  static const ASSIGNED_POLICE_UPDATE = PATHS.ASSIGNED_POLICE_UPDATE;
  static const ASSIGNED_POLICE_DELETE = PATHS.ASSIGNED_POLICE_DELETE;
  static const ASSIGNED_POLICE_VIEW_BY_EVENT =
      PATHS.ASSIGNED_POLICE_VIEW_BY_EVENT;

  // static const PASSWORD_MANAGER = PATHS.PASSWORD_MANAGER;
  static const POLICE_STATION = PATHS.POLICE_STATION;
  static const POLICE_STATION_CREATE = PATHS.POLICE_STATION_CREATE;
  static const POLICE_CREATE = PATHS.POLICE_CREATE;
  static const DESIGNATION_VIEW = PATHS.DESIGNATION_VIEW;
  static const SYSTEM = '/system';
}

class PATHS {
  PATHS._();
  static const ASSESMENT = '/assesment';
  static const PointAssesment = '/point-assesment';
  static const DUTYPOINT = '/dutypoint';
  static const POINTLIST = '/pointlist';
  static const ZONELIST = '/zonelist';
  static const DUTYPOINTALLOCATION = '/dutypointallocation';
  static const OFFICERDATA = '/officerdata';
  static const ROADBANDOBAST = '/roadbandobast';
  static const SETTING = '/setting';
  static const ASSESMENT_CREATE = '/assesment-create';
  static const SHOW_POINTS_ASSESMENT = "/show-point-assesment";
  static const EVENT_SHOW = "/event";
  static const EVENT_CREATE = "/event-create";
  static const EVENT_UPDATE = "/event-update";
  static const ASSIGNED_POLICE = "/assigned-police";
  static const ASSIGNED_POLICE_ADD = "/assigned-police-add";
  static const ASSIGNED_POLICE_UPDATE = "/assigned-police-update";
  static const ASSIGNED_POLICE_DELETE = "/assigned-police-delete";
  static const ASSIGNED_POLICE_VIEW_BY_EVENT = '/assigned-police-view-by-event';
  static const POLICE_STATION = '/police-station';
  static const POLICE_STATION_CREATE = '/police-station-create';
  static const POLICE_CREATE = '/police-create';
  static const DESIGNATION_VIEW = '/designation-view';
}
