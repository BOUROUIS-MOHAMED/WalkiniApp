import 'dart:ffi';

class BanModel {
  int? id;
  String? name;
  String? description;
  String? reason;
  Long? banDurationInSeconds;
  String? message;
  String? createdAt;
  String? modifiedAt;

  BanModel(
      {this.id,
        this.name,
        this.description,
        this.reason,
        this.banDurationInSeconds,
        this.message,
        this.createdAt,
        this.modifiedAt});

  BanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    reason = json['reason'];
    banDurationInSeconds = json['banDurationInSeconds'];
    message = json['message'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['reason'] = this.reason;
    data['banDurationInSeconds'] = this.banDurationInSeconds;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
