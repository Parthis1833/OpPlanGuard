import 'package:e_bandobas/app/Api/models/Police/Designation.dart';
import 'PoliceStation.dart';

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
    print(id.toString() +
        " " +
        fullName.toString() +
        " " +
        buckleNumber.toString() +
        " " +
        number.toString() +
        " " +
        age.toString() +
        " " +
        district.toString() +
        " " +
        gender.toString() +
        " ");
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
