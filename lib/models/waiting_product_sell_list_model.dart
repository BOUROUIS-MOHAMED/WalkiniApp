class WaitingProductSellListModel {
  int? id;
  int? userId;
  int? productId;
  int? buyingQuantity;
  String? buyingPrice;
  int? couponId;
  String? status;
  String? message;
  String? createdAt;
  String? modifiedAt;

  WaitingProductSellListModel(
      {this.id,
        this.userId,
        this.productId,
        this.buyingQuantity,
        this.buyingPrice,
        this.couponId,
        this.status,
        this.message,
        this.createdAt,
        this.modifiedAt});

  WaitingProductSellListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    productId = json['productId'];
    buyingQuantity = json['buyingQuantity'];
    buyingPrice = json['buyingPrice'];
    couponId = json['couponId'];
    status = json['status'];
    message = json['message'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    data['buyingQuantity'] = this.buyingQuantity;
    data['buyingPrice'] = this.buyingPrice;
    data['couponId'] = this.couponId;
    data['status'] = this.status;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
