class CouponWalletModel {
  int? id;
  int? userId;
  int? couponId;
  int? couponOwnedQuantity;
  DateTime? createdAt;
DateTime? modifiedAt;

  CouponWalletModel(
      {this.id,
        this.userId,
        this.couponId,
        this.couponOwnedQuantity,
        this.createdAt,
        this.modifiedAt});

  CouponWalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    couponId = json['couponId'];
    couponOwnedQuantity = json['couponOwnedQuantity'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['couponId'] = this.couponId;
    data['couponOwnedQuantity'] = this.couponOwnedQuantity;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
