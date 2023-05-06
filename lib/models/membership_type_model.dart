class MembershipTypeModel {
  int? id;
  String? name;
  String? description;
  String? color;
  String? price;
  String? badge;
  Duration? duration;
  String? modifiedAttribute;
  DateTime? createdAt;
DateTime? modifiedAt;

  MembershipTypeModel(
      {this.id,
        this.name,
        this.description,
        this.color,
        this.price,
        this.badge,
        this.duration,
        this.modifiedAttribute,
        this.createdAt,
        this.modifiedAt});

  MembershipTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    color = json['color'];
    price = json['price'];
    badge = json['badge'];
    duration = json['duration'];
    modifiedAttribute = json['modifiedAttribute'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color;
    data['price'] = this.price;
    data['badge'] = this.badge;
    data['duration'] = this.duration;
    data['modifiedAttribute'] = this.modifiedAttribute;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
