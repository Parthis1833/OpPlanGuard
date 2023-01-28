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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event-id'] = eventId;
    data['point-id'] = pointId;
    data['event-name'] = eventName;
    data['assignments'] = assignments;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['designation-id'] = designationId;
    data['designation-name'] = designationName;
    data['designation-count'] = designationCount;
    return data;
  }
}
