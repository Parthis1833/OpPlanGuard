import '../PoliceData/PoliceIdNameDesigNumbModel.dart';
import 'eventPointAssignmentModel.dart';

class EventAssignmentModel {
  EventAssignmentModel({
    this.eventId,
    this.pointAssignments,
    this.fileName
  });

  EventAssignmentModel.fromJson(dynamic json) {
    eventId = json['event-id'] ?? 0;
    fileName = json['filename'] ?? "";
    pointAssignments = [];
    // we hhave loop here as we have apppppppppppppppppppi data coming in llllllloop
    if (json['point-assignments'] != null) {
      // each assignment represennnt each objjjeeeeeeeect coming frrrrom api ex     array[0]
      json['point-assignments'].forEach((assignment) {
        // to reduce code I havve made another model who can decode internal data of point-ass
        pointAssignments!.add(EventPointAssignmentModel.fromJson(assignment));
      });
    }
  }
  num? eventId;
  String? fileName;
  List<EventPointAssignmentModel>? pointAssignments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event-id'] = eventId;
    map['filename'] = fileName;
    map['point-assignments'] = pointAssignments;
    return map;
  }
}
