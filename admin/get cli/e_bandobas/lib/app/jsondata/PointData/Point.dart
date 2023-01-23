class Point {
  Point({
    this.id,
    this.taluka,
    this.district,
    this.pointName,
    this.accessories,
    this.remarks
  });

  Point.fromJson(dynamic json) {
    id = json['id'];
    taluka = json['taluka'];
    district = json['district'];
    pointName = json['pointName'];
    accessories = json['accessories'];
    remarks = json['remarks'];
    zone = json['zone'];
  }
  num? id;
  String? taluka;
  String? district;
  String? pointName;
  String? accessories;
  String? remarks;
  num? zone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = taluka;
    map['district'] = district;
    map['pointName'] = pointName;
    map['accessories'] = accessories;
    map['remarks'] = remarks;
    map['zone'] = zone;

    return map;
  }
}
