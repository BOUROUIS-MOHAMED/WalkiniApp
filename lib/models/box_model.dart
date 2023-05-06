class BoxModel {
  int? id;
  String? name;
  String? description;
  String? places;
  String? coins;
  String? boosts;
  String? coupons;
  String? coinPrice;
  String? emeraldPrice;
  bool? buyInEmerald;
  Duration? duration;
  int? availableQuantity;
  int? leftQuantity;
  DateTime? createdAt;
DateTime? modifiedAt;

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
        this.buyInEmerald,
        this.duration,
        this.availableQuantity,
        this.leftQuantity,
        this.createdAt,
        this.modifiedAt});

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
    duration = json['duration'];
    availableQuantity = json['availableQuantity'];
    leftQuantity = json['leftQuantity'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
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
    data['duration'] = this.duration;
    data['availableQuantity'] = this.availableQuantity;
    data['leftQuantity'] = this.leftQuantity;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
