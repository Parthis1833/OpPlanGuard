class Designation {
  Designation({
    this.id,
    this.name,
    this.nameInGujarati,
  });

  Designation.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameInGujarati = json['nameInGujarati'];
  }
  num? id;
  String? name;
  String? nameInGujarati;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nameInGujarati'] = nameInGujarati;
    return map;
  }
}
