class PointPoliceCountAssignment {
  int? eventId;
  int? pointId;
  String? eventName;
  List<Assignment>? assignments;

  PointPoliceCountAssignment({this.eventId, this.pointId, this.eventName, this.assignments});

  PointPoliceCountAssignment.fromJson(Map<String, dynamic> json) {
    eventId = json['event-id'];
    pointId = json['point-id'];
    eventName = json['event-name'];
    assignments = json['assignments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event-id'] = this.eventId;
    data['point-id'] = this.pointId;
    data['event-name'] = this.eventName;
    data['assignments'] = this.assignments;
    return data;
  }
}

class Assignment {
  int? designationId;
  String? designationName;
  int? designationCount;

  Assignment({this.designationId, this.designationName, this.designationCount});

  Assignment.fromJson(Map<String, dynamic> json) {
    designationId = json['designation-id'];
    designationName = json['designation-name'];
    designationCount = json['designation-count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['designation-id'] = this.designationId;
    data['designation-name'] = this.designationName;
    data['designation-count'] = this.designationCount;
    return data;
  }
}
