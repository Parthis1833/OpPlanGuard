class Point {
  Point(
      {this.id,
      this.taluka,
      this.district,
      this.pointName,
      this.accessories,
      this.remarks, this.zoneName});

  Point.fromJson(dynamic json) {
    id = json['id'] ?? "0";
    taluka = json['taluka'] ?? "";
    district = json['district'] ?? "";
    pointName = json['pointName'] ?? "";
    accessories = json['accessories'] ?? "";
    remarks = json['remarks'] ?? "";
    zone = json['zone'] ?? 0;
    zoneName = json['zone-name'] ?? "";
  }
  num? id;
  String? taluka;
  String? district;
  String? pointName;
  String? accessories;
  String? remarks;
  num? zone;
  String? zoneName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = taluka;
    map['district'] = district;
    map['pointName'] = pointName;
    map['accessories'] = accessories;
    map['remarks'] = remarks;
    map['zone'] = zone;
    map['zone-name'] = zoneName;
    return map;
  }
}
