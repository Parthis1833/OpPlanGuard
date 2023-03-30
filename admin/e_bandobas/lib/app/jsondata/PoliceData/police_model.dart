class PoliceModel {
  PoliceModel(
      {this.id,
      this.fullName,
      this.buckleNumber,
      this.number,
      this.age,
      this.district,
      this.gender,
      this.policeStationName,
      this.isAssigned});

  PoliceModel.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    fullName = json['full-name'] ?? "";
    buckleNumber = json['buckle-number'] ?? "";
    number = json['number'] ?? "";
    age = json['age'] ?? 0;
    district = json['district'] ?? "";
    gender = json['gender'] ?? "";
    policeStationName = json['police-station-name'] ?? "";
    designationName = json['designation-name'] ?? "";
    isAssigned = json['assigned'];
  }

  num? id;
  String? fullName;
  String? buckleNumber;
  String? number;
  num? age;
  String? district;
  String? gender;
  String? policeStationName;
  String? designationName;
  bool? isAssigned;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full-name'] = fullName;
    map['buckle-number'] = buckleNumber;
    map['number'] = number;
    map['age'] = age;
    map['district'] = district;
    map['gender'] = gender;
    map['police-station-name'] = policeStationName;
    map['designation-name'] = designationName;
    map['assigned'] = isAssigned;

    return map;
  }

  @override
  String toString() {
    return '$id $fullName $buckleNumber $number $age $district $gender $policeStationName $designationName $isAssigned';
  }
}
