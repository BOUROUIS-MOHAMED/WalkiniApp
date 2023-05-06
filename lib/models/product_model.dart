class ProductModel {
  int? id;
  String? name;
  String? coinPrice;
  String? emeraldPrice;
  String? image;
  String? category;
  String? score;
  Duration? saleLimitTime;
  double? salePercent;
  int? rarity;
  int? initialQuantity;
  int? leftQuantity;
  String? deliveryPrice;
  int? owner;
  DateTime? createdAt;
DateTime? modifiedAt;
  bool? available;
  bool? onSale;
  bool? deliverable;

  ProductModel(
      {this.id,
        this.name,
        this.coinPrice,
        this.emeraldPrice,
        this.image,
        this.category,
        this.score,
        this.saleLimitTime,
        this.salePercent,
        this.rarity,
        this.initialQuantity,
        this.leftQuantity,
        this.deliveryPrice,
        this.owner,
        this.createdAt,
        this.modifiedAt,
        this.available,
        this.onSale,
        this.deliverable});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coinPrice = json['coinPrice'];
    emeraldPrice = json['emeraldPrice'];
    image = json['image'];
    category = json['category'];
    score = json['score'];
    saleLimitTime = json['saleLimitTime'];
    salePercent = json['salePercent'];
    rarity = json['rarity'];
    initialQuantity = json['initialQuantity'];
    leftQuantity = json['leftQuantity'];
    deliveryPrice = json['deliveryPrice'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    available = json['available'];
    onSale = json['onSale'];
    deliverable = json['deliverable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['coinPrice'] = this.coinPrice;
    data['emeraldPrice'] = this.emeraldPrice;
    data['image'] = this.image;
    data['category'] = this.category;
    data['score'] = this.score;
    data['saleLimitTime'] = this.saleLimitTime;
    data['salePercent'] = this.salePercent;
    data['rarity'] = this.rarity;
    data['initialQuantity'] = this.initialQuantity;
    data['leftQuantity'] = this.leftQuantity;
    data['deliveryPrice'] = this.deliveryPrice;
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['available'] = this.available;
    data['onSale'] = this.onSale;
    data['deliverable'] = this.deliverable;
    return data;
  }
}
