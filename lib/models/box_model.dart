class BoxModel {
  int? id;
  String? name;
  String? description;
  String? places;
  String? coins;
  String? boosts;
  String? coupons;
  double? coinPrice;
  double? emeraldPrice;
  bool buyInEmerald=false;
  int? availableQuantity;
  int? leftQuantity;
  String? createdAt;
  String? modifiedAt;
  bool? active;

  BoxModel(
      {this.id,
        this.name,
        this.description,
        this.places,
        this.coins,
        this.boosts,
        this.coupons,
        this.coinPrice,
        this.emeraldPrice,
        required this.buyInEmerald,
        this.availableQuantity,
        this.leftQuantity,
        this.createdAt,
        this.modifiedAt,
        this.active});

  BoxModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    places = json['places'];
    coins = json['coins'];
    boosts = json['boosts'];
    coupons = json['coupons'];
    coinPrice = json['coinPrice'];
    emeraldPrice = json['emeraldPrice'];
    buyInEmerald = json['buyInEmerald'];
    availableQuantity = json['availableQuantity'];
    leftQuantity = json['leftQuantity'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['places'] = this.places;
    data['coins'] = this.coins;
    data['boosts'] = this.boosts;
    data['coupons'] = this.coupons;
    data['coinPrice'] = this.coinPrice;
    data['emeraldPrice'] = this.emeraldPrice;
    data['buyInEmerald'] = this.buyInEmerald;
    data['availableQuantity'] = this.availableQuantity;
    data['leftQuantity'] = this.leftQuantity;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['active'] = this.active;
    return data;
  }
}
