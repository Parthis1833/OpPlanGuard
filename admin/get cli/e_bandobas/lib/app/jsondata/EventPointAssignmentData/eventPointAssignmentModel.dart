// this thinf have all data required in police
class EventPointAssignmentModel {
  EventPointAssignmentModel(
      {this.eventId,
      this.pointId,
      this.assignmentCount,
      this.pointName,
      this.zoneName, this.assignedPoliceList
      });

  EventPointAssignmentModel.fromJson(dynamic json) {
    eventId = json['event-id'] ?? 0;
    pointId = json['point-id'] ?? 0;
    pointName = json['point-name'] ?? '';
    pointAccessories = json['point-accessories'] ?? '';
    pointRemarks = json['point-remarks'] ?? '';
    zoneName = json['zone-name'] ?? '';
    assignmentCount = json['assignment-count'] ?? 0;
    if (json['assigned-police-list'] != null) {
      assignedPoliceList = <Assignment>[];
      json['assigned-police-list'].forEach((assignment) {
        assignedPoliceList!.add(Assignment.fromJson(assignment));
      });
    }
  }
  num? eventId;
  num? pointId;
  String? pointName;
  String? pointAccessories;
  String? pointRemarks;
  String? zoneName;
  num? assignmentCount;
  List<Assignment>? assignedPoliceList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event-id'] = eventId;
    map['point-id'] = pointId;
    map['point-name'] = pointName;
    map['point-remarks'] = pointRemarks;
    map['point-accessories'] = pointAccessories;
    map['zone-name'] = zoneName;
    map['assignment-count'] = assignmentCount;
    if (assignedPoliceList != null) {
      map['assigned-Police-list'] =
          assignedPoliceList!.map((a) => a.toJson()).toList();
    }
    return map;
  }
}

class Assignment {
  Assignment(
      {
        this.policeId,
        this.dutyStartDate,
        this.dutyEndDate,
        this.policeName,
        this.policeStationName,
        this.buckleNumber,
        this.gender,
        this.number,
        this.age,
        this.district,
        this.designation
      });

  Assignment.fromJson(dynamic json) {
    policeId = json['police-id'] ?? 0;
    dutyStartDate = json['duty-start-date'] ?? '';
    dutyEndDate = json['duty-end-date'] ?? '';
    policeName = json['police-name'] ?? '';
    policeStationName = json['police-station-name'] ?? '';
    buckleNumber = json['buckle-number'] ?? '';
    gender = json['gender'] ?? '';
    number = json['number'] ?? '';
    age = json['age'] ?? '';
    district = json['district'] ?? '';
    designation = json['designation'] ?? '';
  }
  num? policeId;
  String? dutyStartDate;
  String? dutyEndDate;
  String? policeName;
  String? policeStationName;
  String? buckleNumber;
  String? gender;
  String? number;
  String? age;
  String? district;
  String? designation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['police-id'] = policeId;
    map['duty-start-date'] = dutyStartDate;
    map['duty-end-date'] = dutyEndDate;
    map['police-name'] = policeName;
    map['police-station-name'] = policeStationName;
    map['buckle-number'] = buckleNumber;
    map['gender'] = gender;
    map['number'] = number;
    map['age'] = age;
    map['district'] = district;
    map['designation'] = designation;
    return map;
  }
}