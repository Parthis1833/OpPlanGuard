class APIConstants {
  static const BASE_URL = "http://localhost:8080";

  // POLICE APIS
  static const POLICE = "/police/";
  static const POLICE_URL = BASE_URL + POLICE; // FOR GET REQUEST
  static const POLICE_IN_EVENT =
      BASE_URL + POLICE + "police-in-event/"; // for GET REQUEST append id
  static const POLICE_URL_CREATE = BASE_URL + POLICE; // FOR POST REQUEST
  static const POLICE_URL_UPDATE =
      BASE_URL + POLICE; // NEED TO APPEND POLICE ID
  static const POLICE_URL_DELETE =
      BASE_URL + POLICE; // NEED TO APPEND POLICE ID
  static const POLICE_URL_UPLOAD_FROM_EXCEL =
      BASE_URL + POLICE + "upload-from-excel"; // FOR POST REQUEST
  static const POLICE_READ_SPECIFIC =
      BASE_URL + POLICE; // NEED TO APPEND POLICE ID
  static const POLICE_OFFICER_DATA =
      BASE_URL + POLICE + "officer-data"; // FOR GET REQ
  static const POLICE_SAMPLE_EXCEL =
      BASE_URL + POLICE + "download-sample-police-excel";

  // POLICE STATIONS APIS
  static const POLICESTATION = "/police-station/";
  static const POLICESTATION_URL = BASE_URL + POLICESTATION; //
  static const POLICESTATION_URL_CREATE =
      BASE_URL + POLICESTATION; // for post request
  static const POLICESTATION_URL_UPDATE =
      BASE_URL + POLICESTATION; // need to append id with put req
  static const POLICESTATION_URL_DELETE =
      BASE_URL + POLICESTATION; // append id with del req
  static const POLICESTATION_URL_UPLOAD_FROM_EXCEL =
      BASE_URL + POLICESTATION + "upload-from-excel"; // get req
  static const POLICESTATION_READ_SPECIFIC =
      BASE_URL + POLICESTATION; // append id
  static const POLICESTATION_SAMPLE_EXCEL = POLICESTATION_URL + "download-sample-station-excel"; // append id

  // POINT APIS
  static const POINT = "/point/";
  static const POINT_URL = BASE_URL + POINT; // FOR GET REQUEST
  static const POINT_URL_CREATE = BASE_URL + POINT; // FOR POST REQUEST
  static const POINT_URL_UPDATE =
      BASE_URL + POINT; // NEED TO Append id with put req
  static const POINT_URL_DELETE =
      BASE_URL + POINT; // NEED TO Append id with del req
  // static const POINT_URL_UPLOAD_FROM_EXCEL =
  static const POINT_READ_SPECIFIC =
      BASE_URL + POINT; // Need to Append id with get req
  static const POINT_POLICE_ASSIGNED_POINT =
      BASE_URL + POINT + "police-assigned-points"; // append event id

  // EVENT APIS
  static const EVENT = "/event/";
  static const EVENT_URL = BASE_URL + EVENT; // FOR GET REQUEST
  static const EVENT_URL_CREATE = BASE_URL + EVENT; // FOR POST REQUEST
  static const EVENT_URL_UPDATE = BASE_URL + EVENT; // NEED TO Append
  static const EVENT_URL_DELETE = BASE_URL + EVENT; // NEED TO Append
  // static const EVENT_URL_UPLOAD_FROM_EXCEL = BASE_URL + EVENT;
  static const EVENT_READ_SPECIFIC =
      BASE_URL + EVENT; // need to append id with get req

  // DESIGNATAION APIS
  static const DESIGNATION = "/designation/";
  static const DESIGNATION_URL = BASE_URL + DESIGNATION; // FOR GET
  static const DESIGNATION_URL_CREATE = BASE_URL + DESIGNATION; // for post req
  static const DESIGNATION_URL_UPDATE =
      BASE_URL + DESIGNATION; // need to append id with put req
  static const DESIGNATION_URL_DELETE =
      BASE_URL + DESIGNATION; // need to append id with delete
  // static const DESIGNATION_URL_UPLOAD_FROM_EXCEL = BASE_URL + DESIGNATION;
  static const DESIGNATION_READ_SPECIFIC =
      BASE_URL + DESIGNATION; // need to append id with get req
  static const DESIGNATION_FIND_BY =
      BASE_URL + DESIGNATION + "find-by"; // get req

  // ASSIGN POLICE
  static const ASSIGNPOLICE = "/assign-police/";
  static const ASSIGNPOLICE_URL = BASE_URL + ASSIGNPOLICE; //
  static const ASSIGNPOLICE_URL_CREATE = BASE_URL + ASSIGNPOLICE; // post req
  static const ASSIGNPOLICE_URL_CREATE_V2 =
      BASE_URL + ASSIGNPOLICE; // post Req,
  static const ASSIGNPOLICE_URL_ASSIGN_MULTIPLE =
      BASE_URL + ASSIGNPOLICE + "assign_multiple"; // post
  static const ASSIGNPOLICE_URL_UPDATE =
      BASE_URL + ASSIGNPOLICE; // append id for put req
  static const ASSIGNPOLICE_URL_DELETE =
      BASE_URL + ASSIGNPOLICE; // append id for delete req
  // static const ASSIGNPOLICE_URL_UPLOAD_FROM_EXCEL = BASE_URL + ASSIGNPOLICE; // append id for
  static const ASSIGNPOLICE_READ_SPECIFIC =
      BASE_URL + ASSIGNPOLICE; // append if for get req
  static const ASSIGNPOLICE_COUNT_IN_EVENT =
      BASE_URL + ASSIGNPOLICE + "count-police-in-event";
  static const ASSIGNPOLICE_COUNT_IN_POINT_AND_EVENT =
      BASE_URL + ASSIGNPOLICE + "count-police-in-point-event";
  static const ASSIGNPOLICE_POLICE_IN_POINT_AND_EVENT =
      BASE_URL + ASSIGNPOLICE + "police-in-point-event";
  static const ASSIGNPOLICE_POLICE_IN_EVENT =
      BASE_URL + ASSIGNPOLICE + "police-in-event"; // post req

  // zone
  static const ZONE = "/zone/";
  static const ZONE_URL = BASE_URL + ZONE;
  static const ZONE_CREATE = BASE_URL + ZONE;
  static const ZONE_UPDATE = BASE_URL + ZONE; // append id
  static const ZONE_DELETE = BASE_URL + ZONE; // append id
  static const ZONE_READ_SPECIFIC = BASE_URL + ZONE; // append id
  static const ZONE_READ_ALL = BASE_URL + ZONE;

  // event police count
  //http://localhost:8080/event_police_count/designation-counts/740
  static const EVENT_POLICE_COUNT = "/event_police_count/";
  static const EVENT_POLICE_COUNT_CREATE = BASE_URL + EVENT_POLICE_COUNT;
  static const EVENT_POLICE_COUNT_UPDATE = BASE_URL + EVENT_POLICE_COUNT;
  static const EVENT_POLICE_COUNT_READ_ALL = BASE_URL + EVENT_POLICE_COUNT;
  static const EVENT_POLICE_COUNT_READ_SPECIFIC_EVENT =
      BASE_URL + EVENT_POLICE_COUNT;
  static const EVENT_POLICE_COUNT_DESIGNATION_COUNTS =
      BASE_URL + EVENT_POLICE_COUNT + "designation-counts/"; // append event id
  static const EVENT_POLICE_COUNT_ASSIGNMENTS =
      BASE_URL + EVENT_POLICE_COUNT + "assignments";
  static const EVENT_POLICE_COUNT_UNASSIGNED_POLICE_LIST = BASE_URL +
      EVENT_POLICE_COUNT +
      "unassigned_police_list/"; // append event id
  static const EVENT_POLICE_COUNT_UNASSIGNED_POLICE_ID_NAME_DESIG_NUMB_LIST =
      BASE_URL +
          EVENT_POLICE_COUNT +
          "unassigned_police_list_with_details"; // post api
  static const EVENT_POLICE_COUNT_OF_POLICE_BY_DESIGNATION = BASE_URL +
      EVENT_POLICE_COUNT +
      "count_police_in_event_by_designation/"; // append event id

  // point police count
  static const POINT_POLICE_COUNT = "/point_police_count/";
  static const POINT_POLICE_COUNT_CREATE = BASE_URL + "/point_police_count/";
  static const POINT_POLICE_COUNT_UPDATE =
      BASE_URL + "/point_police_count/"; // need to append id
  static const POINT_POLICE_COUNT_READ_ALL = BASE_URL + "/point_police_count/";
  static const POINT_POLICE_COUNT_READ_ALL_SPECIFIC_POINT =
      BASE_URL + "/point_police_count/"; // APPEND POINT ID
  static const POINT_POLICE_COUNT_DESIGNATION_COUNTS =
      BASE_URL + "/point_police_count/" + "designation-counts";
      static const POINT_POLICE_COUNT_ALL_POINT_DESIGNATION_COUNTS =
      BASE_URL + "/point_police_count/" + "all-point-designation-counts-in-event";
  static const POINT_POLICE_COUNT_SAVE_UPDATE = BASE_URL + "/point_police_count/" + "save-update"; // post
  // static const POINT_POLICE_COUNT_CREATE_ASSIGNMENTS = BASE_URL + "/point_police_count/" + "assignments";

  // password manager
  static const PASSWORD_MANAGER = "/password-manager";
  static const PASSWORD_MANAGER_CREATE =
      BASE_URL + PASSWORD_MANAGER + "/create-password";
  static const PASSWORD_MANAGER_VERIFY =
      BASE_URL + PASSWORD_MANAGER + "/verify-password";
  static const PASSWORD_MANAGER_HISTORY =
      BASE_URL + PASSWORD_MANAGER + "/history";
}
