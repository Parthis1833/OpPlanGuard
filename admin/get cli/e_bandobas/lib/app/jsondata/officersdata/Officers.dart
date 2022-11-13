import 'dart:convert';


Officers officersFromJson(String str) => Officers.fromJson(json.decode(str));
String officersToJson(Officers data) => json.encode(data.toJson());
class Officers {
  Officers({
      num? id, 
      String? fullName, 
      String? buckleNumber, 
      String? number, 
      num? age, 
      String? district, 
      String? gender, 
      PoliceStation? policeStation, 
      Designation? designation,}){
    _id = id;
    _fullName = fullName;
    _buckleNumber = buckleNumber;
    _number = number;
    _age = age;
    _district = district;
    _gender = gender;
    _policeStation = policeStation;
    _designation = designation;
}

  Officers.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['fullName'];
    _buckleNumber = json['buckleNumber'];
    _number = json['number'];
    _age = json['age'];
    _district = json['district'];
    _gender = json['gender'];
    _policeStation = json['policeStation'] != null ? PoliceStation.fromJson(json['policeStation']) : null;
    _designation = json['designation'] != null ? Designation.fromJson(json['designation']) : null;
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
Officers copyWith({  num? id,
  String? fullName,
  String? buckleNumber,
  String? number,
  num? age,
  String? district,
  String? gender,
  PoliceStation? policeStation,
  Designation? designation,
}) => Officers(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  buckleNumber: buckleNumber ?? _buckleNumber,
  number: number ?? _number,
  age: age ?? _age,
  district: district ?? _district,
  gender: gender ?? _gender,
  policeStation: policeStation ?? _policeStation,
  designation: designation ?? _designation,
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
    return map;
  }

}

/// id : 3
/// name : "PSI"

Designation designationFromJson(String str) => Designation.fromJson(json.decode(str));
String designationToJson(Designation data) => json.encode(data.toJson());
class Designation {
  Designation({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Designation.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Designation copyWith({  num? id,
  String? name,
}) => Designation(  id: id ?? _id,
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

/// id : 8
/// district : "junagadh"
/// taluko : "junagadh"
/// contactNumber : "9106608886"
/// address : "joshipura, jnd, 362001"
/// policeStationName : "SOG"
/// headPolice : null

PoliceStation policeStationFromJson(String str) => PoliceStation.fromJson(json.decode(str));
String policeStationToJson(PoliceStation data) => json.encode(data.toJson());
class PoliceStation {
  PoliceStation({
      num? id, 
      String? district, 
      String? taluko, 
      String? contactNumber, 
      String? address, 
      String? policeStationName, 
      dynamic headPolice,}){
    _id = id;
    _district = district;
    _taluko = taluko;
    _contactNumber = contactNumber;
    _address = address;
    _policeStationName = policeStationName;
    _headPolice = headPolice;
}

  PoliceStation.fromJson(dynamic json) {
    _id = json['id'];
    _district = json['district'];
    _taluko = json['taluko'];
    _contactNumber = json['contactNumber'];
    _address = json['address'];
    _policeStationName = json['policeStationName'];
    _headPolice = json['headPolice'];
  }
  num? _id;
  String? _district;
  String? _taluko;
  String? _contactNumber;
  String? _address;
  String? _policeStationName;
  dynamic _headPolice;
PoliceStation copyWith({  num? id,
  String? district,
  String? taluko,
  String? contactNumber,
  String? address,
  String? policeStationName,
  dynamic headPolice,
}) => PoliceStation(  id: id ?? _id,
  district: district ?? _district,
  taluko: taluko ?? _taluko,
  contactNumber: contactNumber ?? _contactNumber,
  address: address ?? _address,
  policeStationName: policeStationName ?? _policeStationName,
  headPolice: headPolice ?? _headPolice,
);
  num? get id => _id;
  String? get district => _district;
  String? get taluko => _taluko;
  String? get contactNumber => _contactNumber;
  String? get address => _address;
  String? get policeStationName => _policeStationName;
  dynamic get headPolice => _headPolice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['district'] = _district;
    map['taluko'] = _taluko;
    map['contactNumber'] = _contactNumber;
    map['address'] = _address;
    map['policeStationName'] = _policeStationName;
    map['headPolice'] = _headPolice;
    return map;
  }

}