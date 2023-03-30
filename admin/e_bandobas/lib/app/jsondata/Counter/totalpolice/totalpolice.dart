/// content : [{"designation-id":4,"name":"DIGP","name-in-gujarati":"ડીઆઈજીપી","assigned-count":0,"total-police-count":0},{"designation-id":5,"name":"SP","name-in-gujarati":"એસ.પી","assigned-count":0,"total-police-count":0},{"designation-id":6,"name":"DYSP","name-in-gujarati":"ડીવાયએસપી","assigned-count":0,"total-police-count":6},{"designation-id":7,"name":"PI","name-in-gujarati":"પી.આઈ","assigned-count":0,"total-police-count":24},{"designation-id":8,"name":"PSI","name-in-gujarati":"પી.એસ.આઈ","assigned-count":0,"total-police-count":82},{"designation-id":9,"name":"WPSI","name-in-gujarati":"ડબલ્યુ.પી.એસ.આઈ","assigned-count":0,"total-police-count":9},{"designation-id":10,"name":"ASI","name-in-gujarati":"એ.એસ.આઈ","assigned-count":0,"total-police-count":57},{"designation-id":12,"name":"PC","name-in-gujarati":"પીસી","assigned-count":0,"total-police-count":354},{"designation-id":13,"name":"WPC","name-in-gujarati":"ડબલ્યુપીસી","assigned-count":0,"total-police-count":72},{"designation-id":14,"name":"LRD","name-in-gujarati":"એલઆરડી","assigned-count":0,"total-police-count":334},{"designation-id":15,"name":"WLRD","name-in-gujarati":"ડબલ્યુએલઆરડી","assigned-count":0,"total-police-count":293},{"designation-id":16,"name":"HG","name-in-gujarati":"HG","assigned-count":0,"total-police-count":489},{"designation-id":17,"name":"GRD","name-in-gujarati":"GRD","assigned-count":0,"total-police-count":0},{"designation-id":18,"name":"SRP","name-in-gujarati":"એસ.આર.પી","assigned-count":0,"total-police-count":0},{"designation-id":19,"name":"PHC","name-in-gujarati":"પીએચસી","assigned-count":0,"total-police-count":104},{"designation-id":11,"name":"WASI","name-in-gujarati":"ડબલ્યુ.એ.એસ.આઈ","assigned-count":0,"total-police-count":1},{"designation-id":20,"name":"WHC","name-in-gujarati":"ડબલ્યુએચસી","assigned-count":0,"total-police-count":14}]
/// response : {"error":0,"message":"Success","web":false}

class Totalpolice {
  Totalpolice({
      List<Content>? content, 
      Response? response,}){
    _content = content;
    _response = response;
}

  Totalpolice.fromJson(dynamic json) {
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(Content.fromJson(v));
      });
    }
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  List<Content>? _content;
  Response? _response;
Totalpolice copyWith({  List<Content>? content,
  Response? response,
}) => Totalpolice(  content: content ?? _content,
  response: response ?? _response,
);
  List<Content>? get content => _content;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// error : 0
/// message : "Success"
/// web : false

class Response {
  Response({
      num? error, 
      String? message, 
      bool? web,}){
    _error = error;
    _message = message;
    _web = web;
}

  Response.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _web = json['web'];
  }
  num? _error;
  String? _message;
  bool? _web;
Response copyWith({  num? error,
  String? message,
  bool? web,
}) => Response(  error: error ?? _error,
  message: message ?? _message,
  web: web ?? _web,
);
  num? get error => _error;
  String? get message => _message;
  bool? get web => _web;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['web'] = _web;
    return map;
  }

}

/// designation-id : 4
/// name : "DIGP"
/// name-in-gujarati : "ડીઆઈજીપી"
/// assigned-count : 0
/// total-police-count : 0

class Content {
  Content({
      num? designationid, 
      String? name, 
      String? nameingujarati, 
      num? assignedcount, 
      num? totalpolicecount,}){
    _designationid = designationid;
    _name = name;
    _nameingujarati = nameingujarati;
    _assignedcount = assignedcount;
    _totalpolicecount = totalpolicecount;
}

  Content.fromJson(dynamic json) {
    _designationid = json['designation-id'];
    _name = json['name'];
    _nameingujarati = json['name-in-gujarati'];
    _assignedcount = json['assigned-count'];
    _totalpolicecount = json['total-police-count'];
  }
  num? _designationid;
  String? _name;
  String? _nameingujarati;
  num? _assignedcount;
  num? _totalpolicecount;
Content copyWith({  num? designationid,
  String? name,
  String? nameingujarati,
  num? assignedcount,
  num? totalpolicecount,
}) => Content(  designationid: designationid ?? _designationid,
  name: name ?? _name,
  nameingujarati: nameingujarati ?? _nameingujarati,
  assignedcount: assignedcount ?? _assignedcount,
  totalpolicecount: totalpolicecount ?? _totalpolicecount,
);
  num? get designationid => _designationid;
  String? get name => _name;
  String? get nameingujarati => _nameingujarati;
  num? get assignedcount => _assignedcount;
  num? get totalpolicecount => _totalpolicecount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['designation-id'] = _designationid;
    map['name'] = _name;
    map['name-in-gujarati'] = _nameingujarati;
    map['assigned-count'] = _assignedcount;
    map['total-police-count'] = _totalpolicecount;
    return map;
  }
}