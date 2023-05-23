class MembershipTypeModel {
  int? id;
  String? name;
  String? description;
  double? price;
  int? badge;
  int? membershipDurationInMonths;
  int? modifiedAttribute;
  String? createdAt;
  String? modifiedAt;

  MembershipTypeModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.badge,
        this.membershipDurationInMonths,
        this.modifiedAttribute,
        this.createdAt,
        this.modifiedAt});

  MembershipTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    badge = json['badge'];
    membershipDurationInMonths = json['membershipDurationInMonths'];
    modifiedAttribute = json['modifiedAttribute'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['badge'] = this.badge;
    data['membershipDurationInMonths'] = this.membershipDurationInMonths;
    data['modifiedAttribute'] = this.modifiedAttribute;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
