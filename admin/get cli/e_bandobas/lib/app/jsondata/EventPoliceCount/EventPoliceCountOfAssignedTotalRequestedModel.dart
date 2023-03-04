class EventPoliceCountAssignedTotalRequestedModel {
  EventPoliceCountAssignedTotalRequestedModel(
      {this.designationId,
      this.designationName,
      this.dNameInGuj,
      this.assignedCount,
      this.totalPoliceCount,
      this.totalAskedCount});

  EventPoliceCountAssignedTotalRequestedModel.fromJson(dynamic json) {
    designationId = json['designation-id'] ?? 0;
    designationName = json['name'] ?? "";
    dNameInGuj = json['name-in-gujarati'] ?? "";
    assignedCount = json['assigned-count'] ?? 0;
    totalPoliceCount = json['total-police-count'] ?? 0;
    totalAskedCount = json['total-asked-count'] ?? 0;
  }
  num? designationId;
  String? designationName;
  String? dNameInGuj;
  num? assignedCount;
  num? totalPoliceCount;
  num? totalAskedCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['designation-id'] = designationId;
    map['name'] = designationName;
    map['name-in-gujarati'] = dNameInGuj;
    map['assigned-count'] = assignedCount;
    map['total-police-count'] = totalPoliceCount;
    map['total-asked-count'] = totalAskedCount;
    return map;
  }
}
