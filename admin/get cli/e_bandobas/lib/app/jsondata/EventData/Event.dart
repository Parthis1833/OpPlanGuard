class Event {
  Event(
      {this.id,
      this.eventName,
      this.eventDetails,
      this.eventStartDate,
      this.eventEndDate});

  Event.fromJson(dynamic json) {
    id = json['event-id'];
    eventName = json['event-name'];
    eventDetails = json['event-details'];
    eventStartDate = json['event-start-date'];
    eventEndDate = json['event-end-date'];
  }
  num? id;
  String? eventName;
  String? eventDetails;
  String? eventStartDate;
  String? eventEndDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event-id'] = id;
    map['event-name'] = eventName;
    map['event-details'] = eventDetails;
    map['event-start-date'] = eventStartDate;
    map['event-end-date'] = eventEndDate;
    return map;
  }
}
