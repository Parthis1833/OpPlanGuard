class PasswordHistoriesModel {
  PasswordHistoriesModel({this.histories});

  PasswordHistoriesModel.fromJson(dynamic json) {
    histories = [];
    if (json['password-histories'] != null) {
      json['password-histories'].forEach((history) {
        histories!.add(PasswordHistoryModel.fromJson(history));
      });
    }
  }
  List<PasswordHistoryModel>? histories;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password-histories'] = histories;
    return map;
  }
}

class PasswordHistoryModel {
  PasswordHistoryModel({
    this.eventName,
    this.usedAt,
    this.userName,
    this.ip,
    this.phoneNumber,
    this.deviceType,
    this.accessType
  });

  PasswordHistoryModel.fromJson(dynamic json) {
    eventName = json['event-name'];
    usedAt = json['used-at'];
    userName = json['user-name'];
    ip = json['ip'];
    phoneNumber = json['phone-number'];
    deviceType = json['device-type'];
    accessType = json['access-type'];
  }
  String? eventName;
  String? usedAt;
  String? userName;
  String? ip;
  String? phoneNumber;
  String? deviceType;
  String? accessType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event-name'] = eventName;
    map['used-at'] = usedAt;
    map['user-name'] = userName;
    map['ip'] = ip;
    map['phoneNumber'] = phoneNumber;
    map['device-type'] = deviceType;
    map['access-type'] = accessType;
    return map;
  }
}
