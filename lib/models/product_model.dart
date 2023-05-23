class ProductModel {
  int? id;
  String? name;
  String? description;
  double? coinPrice;
  double? emeraldPrice;
  String? image;
  int? category;
  String? score;
  int? saleLimitTimeInSeconds;
  double? salePercent;
  int? rarity;
  int? initialQuantity;
  int? leftQuantity;
  int? owner;
  bool? canUseCoupon;
  String? createdAt;
  String? modifiedAt;
  bool? onSale;
  bool? available;
  bool? deliverable;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.coinPrice,
        this.emeraldPrice,
        this.image,
        this.category,
        this.score,
        this.saleLimitTimeInSeconds,
        this.salePercent,
        this.rarity,
        this.initialQuantity,
        this.leftQuantity,
        this.owner,
        this.canUseCoupon,
        this.createdAt,
        this.modifiedAt,
        this.onSale,
        this.available,
        this.deliverable});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    coinPrice = json['coinPrice'];
    emeraldPrice = json['emeraldPrice'];
    image = json['image'];
    category = json['category'];
    score = json['score'];
    saleLimitTimeInSeconds = json['saleLimitTimeInSeconds'];
    salePercent = json['salePercent'];
    rarity = json['rarity'];
    initialQuantity = json['initialQuantity'];
    leftQuantity = json['leftQuantity'];
    owner = json['owner'];
    canUseCoupon = json['canUseCoupon'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    onSale = json['onSale'];
    available = json['available'];
    deliverable = json['deliverable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['coinPrice'] = this.coinPrice;
    data['emeraldPrice'] = this.emeraldPrice;
    data['image'] = this.image;
    data['category'] = this.category;
    data['score'] = this.score;
    data['saleLimitTimeInSeconds'] = this.saleLimitTimeInSeconds;
    data['salePercent'] = this.salePercent;
    data['rarity'] = this.rarity;
    data['initialQuantity'] = this.initialQuantity;
    data['leftQuantity'] = this.leftQuantity;
    data['owner'] = this.owner;
    data['canUseCoupon'] = this.canUseCoupon;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['onSale'] = this.onSale;
    data['available'] = this.available;
    data['deliverable'] = this.deliverable;
    return data;
  }
}
