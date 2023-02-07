class PoliceIdNameDesigNumb {
  PoliceIdNameDesigNumb({
    this.id,
    this.name,
    this.designation,
    this.number,
    this.district
  });

  PoliceIdNameDesigNumb.fromJson(dynamic json) {
    id = json['police-id'] ?? 0;
    name = json['police-name'] ?? '';
    designation = json['police-designation'] ?? '';
    number = json['police-number'] ?? '';
    district = json['police-district'] ?? '';
  }
  num? id;
  String? name;
  String? designation;
  String? number;
  String? district;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['police-id'] = id;
    map['police-name'] = name;
    map['police-designation'] = designation;
    map['police-number'] = number;
    map['police-district'] = district;
    return map;
  }


  ///this method will prevent the override of toString
  String userAsString() {
    return '#$name';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(PoliceIdNameDesigNumb model) {
    return id == model.id;
  }

  @override
  String toString() => name.toString();
}
