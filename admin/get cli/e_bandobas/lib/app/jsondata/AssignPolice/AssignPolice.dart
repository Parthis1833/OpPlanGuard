/// content : [{"id":8134,"police":{"id":754,"fullName":"shyam baba 2","buckleNumber":"sk2","number":"9106608886","age":21,"district":"junagadh","gender":"male","policeStation":{"id":70,"district":"Ahmedabad City","districtInGuj":"અમદાવાદ શહેર","taluko":"-","talukoInGuj":"-","contactNumber":"","address":"-","policeStationName":"B-Traffic","policeStationNameInGujarati":"ટ હોગળી","headPolice":null},"designation":{"id":11,"name":"WASI","nameInGujarati":"ડબલ્યુ.એ.એસ.આઈ"},"event":{"id":740,"eventName":"parthis","eventDetails":"12","eventStartDate":"02/02/2023","eventEndDate":"02/02/2023"},"assigned":false},"point":{"id":8114,"taluka":"junagadh","district":"junagadh","pointName":"bhavnath-3","accessories":"gun","remarks":"shooting karne ka","zone":{"id":8113,"name":"Zone A"}},"assignedDate":"01/02/2023","dutyStartDate":"02/02/2023","dutyEndDate":"01/02/2023","event":{"id":740,"eventName":"parthis","eventDetails":"12","eventStartDate":"02/02/2023","eventEndDate":"02/02/2023"}}]
/// response : {"error":0,"message":"Success","web":false}

class AssignPolice {
  AssignPolice({
      List<Content>? content, 
      Response? response,}){
    _content = content;
    _response = response;
}

  AssignPolice.fromJson(dynamic json) {
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(Content.fromJson(v));
      });
    }
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  List<Content>? _content;
  Response? _response;
AssignPolice copyWith({  List<Content>? content,
  Response? response,
}) => AssignPolice(  content: content ?? _content,
  response: response ?? _response,
);
  List<Content>? get content => _content;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// error : 0
/// message : "Success"
/// web : false

class Response {
  Response({
      num? error, 
      String? message, 
      bool? web,}){
    _error = error;
    _message = message;
    _web = web;
}

  Response.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _web = json['web'];
  }
  num? _error;
  String? _message;
  bool? _web;
Response copyWith({  num? error,
  String? message,
  bool? web,
}) => Response(  error: error ?? _error,
  message: message ?? _message,
  web: web ?? _web,
);
  num? get error => _error;
  String? get message => _message;
  bool? get web => _web;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['web'] = _web;
    return map;
  }

}

/// id : 8134
/// police : {"id":754,"fullName":"shyam baba 2","buckleNumber":"sk2","number":"9106608886","age":21,"district":"junagadh","gender":"male","policeStation":{"id":70,"district":"Ahmedabad City","districtInGuj":"અમદાવાદ શહેર","taluko":"-","talukoInGuj":"-","contactNumber":"","address":"-","policeStationName":"B-Traffic","policeStationNameInGujarati":"ટ હોગળી","headPolice":null},"designation":{"id":11,"name":"WASI","nameInGujarati":"ડબલ્યુ.એ.એસ.આઈ"},"event":{"id":740,"eventName":"parthis","eventDetails":"12","eventStartDate":"02/02/2023","eventEndDate":"02/02/2023"},"assigned":false}
/// point : {"id":8114,"taluka":"junagadh","district":"junagadh","pointName":"bhavnath-3","accessories":"gun","remarks":"shooting karne ka","zone":{"id":8113,"name":"Zone A"}}
/// assignedDate : "01/02/2023"
/// dutyStartDate : "02/02/2023"
/// dutyEndDate : "01/02/2023"
/// event : {"id":740,"eventName":"parthis","eventDetails":"12","eventStartDate":"02/02/2023","eventEndDate":"02/02/2023"}

class Content {
  Content({
      num? id, 
      Police? police, 
      Point? point, 
      String? assignedDate, 
      String? dutyStartDate, 
      String? dutyEndDate, 
      Event? event,}){
    _id = id;
    _police = police;
    _point = point;
    _assignedDate = assignedDate;
    _dutyStartDate = dutyStartDate;
    _dutyEndDate = dutyEndDate;
    _event = event;
}

  Content.fromJson(dynamic json) {
    _id = json['id'];
    _police = json['police'] != null ? Police.fromJson(json['police']) : null;
    _point = json['point'] != null ? Point.fromJson(json['point']) : null;
    _assignedDate = json['assignedDate'];
    _dutyStartDate = json['dutyStartDate'];
    _dutyEndDate = json['dutyEndDate'];
    _event = json['event'] != null ? Event.fromJson(json['event']) : null;
  }
  num? _id;
  Police? _police;
  Point? _point;
  String? _assignedDate;
  String? _dutyStartDate;
  String? _dutyEndDate;
  Event? _event;
Content copyWith({  num? id,
  Police? police,
  Point? point,
  String? assignedDate,
  String? dutyStartDate,
  String? dutyEndDate,
  Event? event,
}) => Content(  id: id ?? _id,
  police: police ?? _police,
  point: point ?? _point,
  assignedDate: assignedDate ?? _assignedDate,
  dutyStartDate: dutyStartDate ?? _dutyStartDate,
  dutyEndDate: dutyEndDate ?? _dutyEndDate,
  event: event ?? _event,
);
  num? get id => _id;
  Police? get police => _police;
  Point? get point => _point;
  String? get assignedDate => _assignedDate;
  String? get dutyStartDate => _dutyStartDate;
  String? get dutyEndDate => _dutyEndDate;
  Event? get event => _event;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_police != null) {
      map['police'] = _police?.toJson();
    }
    if (_point != null) {
      map['point'] = _point?.toJson();
    }
    map['assignedDate'] = _assignedDate;
    map['dutyStartDate'] = _dutyStartDate;
    map['dutyEndDate'] = _dutyEndDate;
    if (_event != null) {
      map['event'] = _event?.toJson();
    }
    return map;
  }

}

/// id : 740
/// eventName : "parthis"
/// eventDetails : "12"
/// eventStartDate : "02/02/2023"
/// eventEndDate : "02/02/2023"

class Event {
  Event({
      num? id, 
      String? eventName, 
      String? eventDetails, 
      String? eventStartDate, 
      String? eventEndDate,}){
    _id = id;
    _eventName = eventName;
    _eventDetails = eventDetails;
    _eventStartDate = eventStartDate;
    _eventEndDate = eventEndDate;
}

  Event.fromJson(dynamic json) {
    _id = json['id'];
    _eventName = json['eventName'];
    _eventDetails = json['eventDetails'];
    _eventStartDate = json['eventStartDate'];
    _eventEndDate = json['eventEndDate'];
  }
  num? _id;
  String? _eventName;
  String? _eventDetails;
  String? _eventStartDate;
  String? _eventEndDate;
Event copyWith({  num? id,
  String? eventName,
  String? eventDetails,
  String? eventStartDate,
  String? eventEndDate,
}) => Event(  id: id ?? _id,
  eventName: eventName ?? _eventName,
  eventDetails: eventDetails ?? _eventDetails,
  eventStartDate: eventStartDate ?? _eventStartDate,
  eventEndDate: eventEndDate ?? _eventEndDate,
);
  num? get id => _id;
  String? get eventName => _eventName;
  String? get eventDetails => _eventDetails;
  String? get eventStartDate => _eventStartDate;
  String? get eventEndDate => _eventEndDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['eventName'] = _eventName;
    map['eventDetails'] = _eventDetails;
    map['eventStartDate'] = _eventStartDate;
    map['eventEndDate'] = _eventEndDate;
    return map;
  }

}

/// id : 8114
/// taluka : "junagadh"
/// district : "junagadh"
/// pointName : "bhavnath-3"
/// accessories : "gun"
/// remarks : "shooting karne ka"
/// zone : {"id":8113,"name":"Zone A"}

class Point {
  Point({
      num? id, 
      String? taluka, 
      String? district, 
      String? pointName, 
      String? accessories, 
      String? remarks, 
      Zone? zone,}){
    _id = id;
    _taluka = taluka;
    _district = district;
    _pointName = pointName;
    _accessories = accessories;
    _remarks = remarks;
    _zone = zone;
}

  Point.fromJson(dynamic json) {
    _id = json['id'];
    _taluka = json['taluka'];
    _district = json['district'];
    _pointName = json['pointName'];
    _accessories = json['accessories'];
    _remarks = json['remarks'];
    _zone = json['zone'] != null ? Zone.fromJson(json['zone']) : null;
  }
  num? _id;
  String? _taluka;
  String? _district;
  String? _pointName;
  String? _accessories;
  String? _remarks;
  Zone? _zone;
Point copyWith({  num? id,
  String? taluka,
  String? district,
  String? pointName,
  String? accessories,
  String? remarks,
  Zone? zone,
}) => Point(  id: id ?? _id,
  taluka: taluka ?? _taluka,
  district: district ?? _district,
  pointName: pointName ?? _pointName,
  accessories: accessories ?? _accessories,
  remarks: remarks ?? _remarks,
  zone: zone ?? _zone,
);
  num? get id => _id;
  String? get taluka => _taluka;
  String? get district => _district;
  String? get pointName => _pointName;
  String? get accessories => _accessories;
  String? get remarks => _remarks;
  Zone? get zone => _zone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['taluka'] = _taluka;
    map['district'] = _district;
    map['pointName'] = _pointName;
    map['accessories'] = _accessories;
    map['remarks'] = _remarks;
    if (_zone != null) {
      map['zone'] = _zone?.toJson();
    }
    return map;
  }

}

/// id : 8113
/// name : "Zone A"

class Zone {
  Zone({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Zone.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Zone copyWith({  num? id,
  String? name,
}) => Zone(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// id : 754
/// fullName : "shyam baba 2"
/// buckleNumber : "sk2"
/// number : "9106608886"
/// age : 21
/// district : "junagadh"
/// gender : "male"
/// policeStation : {"id":70,"district":"Ahmedabad City","districtInGuj":"અમદાવાદ શહેર","taluko":"-","talukoInGuj":"-","contactNumber":"","address":"-","policeStationName":"B-Traffic","policeStationNameInGujarati":"ટ હોગળી","headPolice":null}
/// designation : {"id":11,"name":"WASI","nameInGujarati":"ડબલ્યુ.એ.એસ.આઈ"}
/// event : {"id":740,"eventName":"parthis","eventDetails":"12","eventStartDate":"02/02/2023","eventEndDate":"02/02/2023"}
/// assigned : false

class Police {
  Police({
      num? id, 
      String? fullName, 
      String? buckleNumber, 
      String? number, 
      num? age, 
      String? district, 
      String? gender, 
      PoliceStation? policeStation, 
      Designation? designation, 
      Event? event, 
      bool? assigned,}){
    _id = id;
    _fullName = fullName;
    _buckleNumber = buckleNumber;
    _number = number;
    _age = age;
    _district = district;
    _gender = gender;
    _policeStation = policeStation;
    _designation = designation;
    _event = event;
    _assigned = assigned;
}

  Police.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['fullName'];
    _buckleNumber = json['buckleNumber'];
    _number = json['number'];
    _age = json['age'];
    _district = json['district'];
    _gender = json['gender'];
    _policeStation = json['policeStation'] != null ? PoliceStation.fromJson(json['policeStation']) : null;
    _designation = json['designation'] != null ? Designation.fromJson(json['designation']) : null;
    _event = json['event'] != null ? Event.fromJson(json['event']) : null;
    _assigned = json['assigned'];
  }
  num? _id;
  String? _fullName;
  String? _buckleNumber;
  String? _number;
  num? _age;
  String? _district;
  String? _gender;
  PoliceStation? _policeStation;
  Designation? _designation;
  Event? _event;
  bool? _assigned;
Police copyWith({  num? id,
  String? fullName,
  String? buckleNumber,
  String? number,
  num? age,
  String? district,
  String? gender,
  PoliceStation? policeStation,
  Designation? designation,
  Event? event,
  bool? assigned,
}) => Police(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  buckleNumber: buckleNumber ?? _buckleNumber,
  number: number ?? _number,
  age: age ?? _age,
  district: district ?? _district,
  gender: gender ?? _gender,
  policeStation: policeStation ?? _policeStation,
  designation: designation ?? _designation,
  event: event ?? _event,
  assigned: assigned ?? _assigned,
);
  num? get id => _id;
  String? get fullName => _fullName;
  String? get buckleNumber => _buckleNumber;
  String? get number => _number;
  num? get age => _age;
  String? get district => _district;
  String? get gender => _gender;
  PoliceStation? get policeStation => _policeStation;
  Designation? get designation => _designation;
  Event? get event => _event;
  bool? get assigned => _assigned;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fullName'] = _fullName;
    map['buckleNumber'] = _buckleNumber;
    map['number'] = _number;
    map['age'] = _age;
    map['district'] = _district;
    map['gender'] = _gender;
    if (_policeStation != null) {
      map['policeStation'] = _policeStation?.toJson();
    }
    if (_designation != null) {
      map['designation'] = _designation?.toJson();
    }
    if (_event != null) {
      map['event'] = _event?.toJson();
    }
    map['assigned'] = _assigned;
    return map;
  }

}

/// id : 740
/// eventName : "parthis"
/// eventDetails : "12"
/// eventStartDate : "02/02/2023"
/// eventEndDate : "02/02/2023"


/// id : 11
/// name : "WASI"
/// nameInGujarati : "ડબલ્યુ.એ.એસ.આઈ"

class Designation {
  Designation({
      num? id, 
      String? name, 
      String? nameInGujarati,}){
    _id = id;
    _name = name;
    _nameInGujarati = nameInGujarati;
}

  Designation.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _nameInGujarati = json['nameInGujarati'];
  }
  num? _id;
  String? _name;
  String? _nameInGujarati;
Designation copyWith({  num? id,
  String? name,
  String? nameInGujarati,
}) => Designation(  id: id ?? _id,
  name: name ?? _name,
  nameInGujarati: nameInGujarati ?? _nameInGujarati,
);
  num? get id => _id;
  String? get name => _name;
  String? get nameInGujarati => _nameInGujarati;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['nameInGujarati'] = _nameInGujarati;
    return map;
  }

}

/// id : 70
/// district : "Ahmedabad City"
/// districtInGuj : "અમદાવાદ શહેર"
/// taluko : "-"
/// talukoInGuj : "-"
/// contactNumber : ""
/// address : "-"
/// policeStationName : "B-Traffic"
/// policeStationNameInGujarati : "ટ હોગળી"
/// headPolice : null

class PoliceStation {
  PoliceStation({
      num? id, 
      String? district, 
      String? districtInGuj, 
      String? taluko, 
      String? talukoInGuj, 
      String? contactNumber, 
      String? address, 
      String? policeStationName, 
      String? policeStationNameInGujarati, 
      dynamic headPolice,}){
    _id = id;
    _district = district;
    _districtInGuj = districtInGuj;
    _taluko = taluko;
    _talukoInGuj = talukoInGuj;
    _contactNumber = contactNumber;
    _address = address;
    _policeStationName = policeStationName;
    _policeStationNameInGujarati = policeStationNameInGujarati;
    _headPolice = headPolice;
}

  PoliceStation.fromJson(dynamic json) {
    _id = json['id'] ?? -1;
    _district = json['district'] ?? '';// ?? is   knownnnnnnnn as null check operator
    _districtInGuj = json['districtInGuj'] ?? '';
    _taluko = json['taluko'] ?? '';
    _talukoInGuj = json['talukoInGuj'] ?? '';
    _contactNumber = json['contactNumber'] ?? '';
    _address = json['address']??'';
    _policeStationName = json['policeStationName']??''; // nameeing convennnntion pooolice-station-name
    _policeStationNameInGujarati = json['policeStationNameInGujarati']??''; // police-staaaaaaaaation-name-in-gujarati
    _headPolice = json['headPolice']??'';
  }
  num? _id;
  String? _district;
  String? _districtInGuj;
  String? _taluko;
  String? _talukoInGuj;
  String? _contactNumber;
  String? _address;
  String? _policeStationName;
  String? _policeStationNameInGujarati;
  dynamic _headPolice;

  // file should not be here only in json folder
  // api method in          assignPoliceApi.dart

PoliceStation copyWith({  num? id,
  String? district,
  String? districtInGuj,
  String? taluko,
  String? talukoInGuj,
  String? contactNumber,
  String? address,
  String? policeStationName,
  String? policeStationNameInGujarati,
  dynamic headPolice,
}) => PoliceStation(  id: id ?? _id,
  district: district ?? _district,
  districtInGuj: districtInGuj ?? _districtInGuj,
  taluko: taluko ?? _taluko,
  talukoInGuj: talukoInGuj ?? _talukoInGuj,
  contactNumber: contactNumber ?? _contactNumber,
  address: address ?? _address,
  policeStationName: policeStationName ?? _policeStationName,
  policeStationNameInGujarati: policeStationNameInGujarati ?? _policeStationNameInGujarati,
  headPolice: headPolice ?? _headPolice,
);
  num? get id => _id;
  String? get district => _district;
  String? get districtInGuj => _districtInGuj;
  String? get taluko => _taluko;
  String? get talukoInGuj => _talukoInGuj;
  String? get contactNumber => _contactNumber;
  String? get address => _address;
  String? get policeStationName => _policeStationName;
  String? get policeStationNameInGujarati => _policeStationNameInGujarati;
  dynamic get headPolice => _headPolice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['district'] = _district;
    map['districtInGuj'] = _districtInGuj;
    map['taluko'] = _taluko;
    map['talukoInGuj'] = _talukoInGuj;
    map['contactNumber'] = _contactNumber;
    map['address'] = _address;
    map['policeStationName'] = _policeStationName;
    map['policeStationNameInGujarati'] = _policeStationNameInGujarati;
    map['headPolice'] = _headPolice;
    return map;
  }
}