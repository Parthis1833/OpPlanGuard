class EventPoliceCountModel {
  EventPoliceCountModel({
    this.eventId,
    this.designations,
  });

  EventPoliceCountModel.fromJson(dynamic json) {
    eventId = json['event-id'];
    designations = json['designations'];
  }
  num? eventId;
  Map<String, String>? designations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = eventId;
    map['designations'] = designations;
    return map;
  }
}
