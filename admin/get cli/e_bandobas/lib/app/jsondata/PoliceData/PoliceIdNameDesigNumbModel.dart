class PoliceIdNameDesigNumb {
  PoliceIdNameDesigNumb({
    this.id,
    this.name,
    this.designation,
    this.number
  });

  PoliceIdNameDesigNumb.fromJson(dynamic json) {
    id = json['police-id'] ?? 0;
    name = json['police-name'] ?? '';
    designation = json['police-designation'] ?? '';
    number = json['police-number'] ?? '';
  }
  num? id;
  String? name;
  String? designation;
  String? number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['police-id'] = id;
    map['police-name'] = name;
    map['police-designation'] = designation;
    map['police-number'] = number;
    return map;
  }
}
