
class PoliceIdName {
  PoliceIdName({
    this.id,
    this.name,
  });

  PoliceIdName.fromJson(dynamic json) {
    id = json['police-id'] ?? 0;
    name = json['police-name'] ?? '';
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['police-id'] = id;
    map['police-name'] = name;
    return map;
  }
}
