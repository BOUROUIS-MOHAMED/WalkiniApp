class PlaceModel {
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  String? description;
  int? rarity;
  String? image;
  Null? coinPrize;
  Null? owner;
  Null? createdAt;
  Null? modifiedAt;

  PlaceModel(
      {this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.description,
        this.rarity,
        this.image,
        this.coinPrize,
        this.owner,
        this.createdAt,
        this.modifiedAt});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    rarity = json['rarity'];
    image = json['image'];
    coinPrize = json['coinPrize'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['rarity'] = this.rarity;
    data['image'] = this.image;
    data['coinPrize'] = this.coinPrize;
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
