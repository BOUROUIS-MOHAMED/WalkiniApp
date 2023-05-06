class CartHistoryModel {
  int? id;
  int? userId;
  String? products;
  String? totalPrice;
  int? couponsUsed;
  DateTime? createdAt;
DateTime? modifiedAt;

  CartHistoryModel(
      {this.id,
        this.userId,
        this.products,
        this.totalPrice,
        this.couponsUsed,
        this.createdAt,
        this.modifiedAt});

  CartHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    products = json['products'];
    totalPrice = json['totalPrice'];
    couponsUsed = json['couponsUsed'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['products'] = this.products;
    data['totalPrice'] = this.totalPrice;
    data['couponsUsed'] = this.couponsUsed;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
