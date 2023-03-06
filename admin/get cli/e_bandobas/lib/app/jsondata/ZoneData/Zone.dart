
class Zone {
  Zone({
    this.id,
    this.name,
  });

  Zone.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
