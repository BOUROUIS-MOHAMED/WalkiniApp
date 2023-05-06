class NotificationModel {
  int? id;
  String? name;
  String? image;
  String? subtitle;
  int? action;
  DateTime? createdAt;
DateTime? modifiedAt;

  NotificationModel(
      {this.id,
        this.name,
        this.image,
        this.subtitle,
        this.action,
        this.createdAt,
        this.modifiedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    subtitle = json['subtitle'];
    action = json['action'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['subtitle'] = this.subtitle;
    data['action'] = this.action;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
