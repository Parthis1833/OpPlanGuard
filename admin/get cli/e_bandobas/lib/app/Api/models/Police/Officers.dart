class Officers {
  Officers({
    this.id,
    this.fullName,
    this.buckleNumber,
    this.number,
    this.age,
    this.district,
    this.gender,
    this.policeStation,
    this.designation,
  });
  Officers.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    buckleNumber = json['buckleNumber'];
    number = json['number'];
    age = json['age'];
    district = json['district'];
    gender = json['gender'];
    policeStation = json['policeStation'] != null
        ? PoliceStation.fromJson(json['policeStation'])
        : null;
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;

    // TODO: remove this when error solved
    // toStringV2();
  }
  num? id;
  String? fullName;
  String? buckleNumber;
  String? number;
  num? age;
  String? district;
  String? gender;
  PoliceStation? policeStation;
  Designation? designation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['buckleNumber'] = buckleNumber;
    map['number'] = number;
    map['age'] = age;
    map['district'] = district;
    map['gender'] = gender;
    if (policeStation != null) {
      map['policeStation'] = policeStation?.toJson();
    }
    if (designation != null) {
      map['designation'] = designation?.toJson();
    }
    return map;
  }
}

class Response {
  Response({
    this.error,
    this.message,
    this.web,
  });

  Response.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    web = json['web'];
  }
  num? error;
  String? message;
  bool? web;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    map['web'] = web;
    return map;
  }
}

class Police {
  Police({
    this.id,
    this.fullName,
    this.buckleNumber,
    this.number,
    this.age,
    this.district,
    this.gender,
    this.policeStation,
    this.designation,
  });
  Police.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    buckleNumber = json['buckleNumber'];
    number = json['number'];
    age = json['age'];
    district = json['district'];
    gender = json['gender'];
    policeStation = json['policeStation'] != null
        ? PoliceStation.fromJson(json['policeStation'])
        : null;
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;

    // TODO: remove this when error solved
    // toStringV2();
  }
  num? id;
  String? fullName;
  String? buckleNumber;
  String? number;
  num? age;
  String? district;
  String? gender;
  PoliceStation? policeStation;
  Designation? designation;

  void toStringV2() {
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['buckleNumber'] = buckleNumber;
    map['number'] = number;
    map['age'] = age;
    map['district'] = district;
    map['gender'] = gender;
    if (policeStation != null) {
      map['policeStation'] = policeStation?.toJson();
    }
    if (designation != null) {
      map['designation'] = designation?.toJson();
    }
    return map;
  }
}

class Designation {
  Designation({
    this.id,
    this.name,
    this.nameInGujarati,
  });

  Designation.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameInGujarati = json['nameInGujarati'];
  }
  num? id;
  String? name;
  String? nameInGujarati;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameInGujarati'] = nameInGujarati;
    return map;
  }
}

class PoliceStation {
  PoliceStation({
    this.id,
    this.district,
    this.districtInGuj,
    this.taluko,
    this.talukoInGuj,
    this.contactNumber,
    this.address,
    this.policeStationName,
    this.policeStationNameInGujarati,
    this.headPolice,
  });

  PoliceStation.fromJson(dynamic json) {
    id = json['id'];
    district = json['district'];
    districtInGuj = json['districtInGuj'];
    taluko = json['taluko'];
    talukoInGuj = json['talukoInGuj'];
    contactNumber = json['contactNumber'];
    address = json['address'];
    policeStationName = json['policeStationName'];
    policeStationNameInGujarati = json['policeStationNameInGujarati'];
    headPolice = json['headPolice'];
  }
  num? id;
  String? district;
  String? districtInGuj;
  String? taluko;
  String? talukoInGuj;
  String? contactNumber;
  String? address;
  String? policeStationName;
  String? policeStationNameInGujarati;
  dynamic headPolice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['district'] = district;
    map['districtInGuj'] = districtInGuj;
    map['taluko'] = taluko;
    map['talukoInGuj'] = talukoInGuj;
    map['contactNumber'] = contactNumber;
    map['address'] = address;
    map['policeStationName'] = policeStationName;
    map['policeStationNameInGujarati'] = policeStationNameInGujarati;
    map['headPolice'] = headPolice;
    return map;
  }
}