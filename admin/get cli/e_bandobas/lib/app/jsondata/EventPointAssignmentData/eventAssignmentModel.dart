import '../PoliceData/PoliceIdNameDesigNumbModel.dart';
import 'eventPointAssignmentModel.dart';

class EventAssignmentModel {
  EventAssignmentModel({
    this.eventId,
    this.pointAssignments,
  });

  EventAssignmentModel.fromJson(dynamic json) {
    eventId = json['event-id'];
    pointAssignments = [];
    if (json['point-assignments'] != null) {
      json['point-assignments'].forEach((assignment) {
        print(assignment);
        pointAssignments!.add(EventPointAssignmentModel.fromJson(assignment));
      });
    }
  }
  num? eventId;
  List<EventPointAssignmentModel>? pointAssignments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event-id'] = eventId;
    map['point-assignments'] = pointAssignments;
    return map;
  }
}
