class PointPoliceCountAssignment {
  int? eventId;
  int? pointId;
  String? eventName;
  String? pointName;
  List<Assignment>? assignments;

  PointPoliceCountAssignment(
      {this.eventId,
      this.pointId,
      this.eventName,
      this.pointName,
      this.assignments});

  PointPoliceCountAssignment.fromJson(Map<String, dynamic> json) {
    eventId = json['event-id'] ?? 0;
    pointId = json['point-id'] ?? 0;
    eventName = json['event-name'] ?? "";
    pointName = json['point-name'] ?? "";
    print("pointname = $pointName");
    // assignments = json['assignments'];
    assignments = [];
    if (json['assignments'] != null) {
      // each assignment represennnt each objjjeeeeeeeect coming frrrrom api ex     array[0]
      json['assignments'].forEach((assignment) {
        // to reduce code I havve made another model who can decode internal data of point-ass
        assignments!.add(Assignment.fromJson(assignment));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event-id'] = eventId;
    data['point-id'] = pointId;
    data['event-name'] = eventName;
    data['point-name'] = pointName;
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
