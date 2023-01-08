class APIConstants {
  static const BASE_URL = "http://localhost:8080";

  // POLICE APIS
  static const POLICE = "/police/";
  static const POLICE_URL = BASE_URL + POLICE; // FOR GET REQUEST
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

  // POLICE STATIONS APIS
  static const POLICESTATION = "/police-station/";
}

// class Police extends APIConstants {
//   static const POLICE_URL = APIConstants.BASE_URL + "/police";
// }
