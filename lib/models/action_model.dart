class ActionModel {
  int? id;
  String? name;
  String? route;
  DateTime? createdAt;
  DateTime? modifiedAt;

  ActionModel(
      {this.id, this.name, this.route, this.createdAt, this.modifiedAt});

  ActionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    route = json['route'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['route'] = this.route;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
