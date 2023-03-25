class PoliceStationModel {
  PoliceStationModel(
      {this.id,
      this.district,
      this.districtInGuj,
      this.taluko,
      this.talukoInGuj,
      this.contactNumber,
      this.address,
      this.policeStationName,
      this.policeStationNameInGujarati});

  PoliceStationModel.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    district = json['district'] ?? "";
    districtInGuj = json['districtInGuj'] ?? "";
    taluko = json['taluko'] ?? "";
    talukoInGuj = json['talukoInGuj'] ?? "";
    contactNumber = json['contactNumber'] ?? "";
    address = json['address'] ?? "";
    policeStationName = json['policeStationName'] ?? "";
    policeStationNameInGujarati = json['policeStationNameInGujarati'] ?? "";
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

    return map;
  }
}
