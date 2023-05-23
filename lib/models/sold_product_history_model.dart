class SoledProductsHistoryModel {
  int? id;
  int? product;
  String? soldPrice;
  int? productBuyer;
  String? usedCoupons;
  String? createdAt;
  String? modifiedAt;

  SoledProductsHistoryModel(
      {this.id,
        this.product,
        this.soldPrice,
        this.productBuyer,
        this.usedCoupons,
        this.createdAt,
        this.modifiedAt});

  SoledProductsHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    soldPrice = json['soldPrice'];
    productBuyer = json['productBuyer'];
    usedCoupons = json['usedCoupons'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['soldPrice'] = this.soldPrice;
    data['productBuyer'] = this.productBuyer;
    data['usedCoupons'] = this.usedCoupons;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
