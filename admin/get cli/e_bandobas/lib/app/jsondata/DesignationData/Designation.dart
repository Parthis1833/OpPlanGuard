class Designation {
  Designation({
    this.id,
    this.name,
    this.nameInGujarati,
    this.isDeletable
  });

  Designation.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name-in-english'] ?? "";
    nameInGujarati = json['name-in-gujarati'] ?? "";
    isDeletable = json['is-deletable'] ?? false;
  }
  num? id;
  String? name;
  String? nameInGujarati;
  bool? isDeletable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name-in-english'] = name;
    map['name-in-gujarati'] = nameInGujarati;
    map['is-deletable'] = isDeletable;
    return map;
  }
}
