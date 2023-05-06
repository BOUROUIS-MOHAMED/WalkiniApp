class BoostsModel {
  int? id;
  String? name;
  String? description;
  String? image;
  Duration? duration;
  String? price;
  String? modifiedAttributes;
  bool? boostInBoxOrNot;
  int? boostRarity;
  DateTime? createdAt;
DateTime? modifiedAt;

  BoostsModel(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.duration,
        this.price,
        this.modifiedAttributes,
        this.boostInBoxOrNot,
        this.boostRarity,
        this.createdAt,
        this.modifiedAt});

  BoostsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    duration = json['duration'];
    price = json['price'];
    modifiedAttributes = json['modifiedAttributes'];
    boostInBoxOrNot = json['boostInBoxOrNot'];
    boostRarity = json['boostRarity'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['modifiedAttributes'] = this.modifiedAttributes;
    data['boostInBoxOrNot'] = this.boostInBoxOrNot;
    data['boostRarity'] = this.boostRarity;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
