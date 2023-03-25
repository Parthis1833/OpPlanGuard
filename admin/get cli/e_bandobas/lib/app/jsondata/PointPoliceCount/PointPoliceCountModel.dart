class PointPoliceCountModel {
  PointPoliceCountModel({
    this.eventId,
    this.pointId,
    this.designations,
  });

  PointPoliceCountModel.fromJson(dynamic json) {
    eventId = json['event-id'];
    pointId = json['point-id'];
    designations = json['designations'];
  }
  num? eventId;
  num? pointId;
  Map<String, String>? designations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event-id'] = eventId;
    map['point-id'] = pointId;
    map['designations'] = designations;
    return map;
  }
}