class Event {
  Event(
      {this.id,
      this.eventName,
      this.eventDetails,
      this.eventStartDate,
      this.eventEndDate});

  Event.fromJson(dynamic json) {
    id = json['id'];
    eventName = json['eventName'];
    eventDetails = json['eventDetails'];
    eventStartDate = json['eventStartDate'];
    eventEndDate = json['eventEndDate'];
  }
  num? id;
  String? eventName;
  String? eventDetails;
  String? eventStartDate;
  String? eventEndDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['eventName'] = eventName;
    map['eventDetails'] = eventDetails;
    map['eventStartDate'] = eventStartDate;
    map['eventEndDate'] = eventEndDate;
    return map;
  }
}
