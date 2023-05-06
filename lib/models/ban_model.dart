class BanModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? reason;
  Duration? banDuration;
  String? message;
  DateTime? createdAt;
  DateTime? modifiedAt;

  BanModel(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.reason,
        this.banDuration,
        this.message,
        this.createdAt,
        this.modifiedAt});

  BanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    reason = json['reason'];
    banDuration = json['banDuration'];
    message = json['message'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['reason'] = this.reason;
    data['banDuration'] = this.banDuration;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
