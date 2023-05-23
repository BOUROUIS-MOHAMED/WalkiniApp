class CouponModel {
  int? id;
  String? couponName;
  int? couponOwner;
  double? couponReductionPercent;
  int? couponQuantity;
  int? couponLeftQuantity;
  int? couponAvailableDurationInSeconds;
  bool? couponAvailable;
  bool? couponOnlyForOwner;
  bool? couponForBox;
  String? createdAt;
  String? modifiedAt;

  CouponModel(
      {this.id,
        this.couponName,
        this.couponOwner,
        this.couponReductionPercent,
        this.couponQuantity,
        this.couponLeftQuantity,
        this.couponAvailableDurationInSeconds,
        this.couponAvailable,
        this.couponOnlyForOwner,
        this.couponForBox,
        this.createdAt,
        this.modifiedAt});

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponName = json['couponName'];
    couponOwner = json['couponOwner'];
    couponReductionPercent = json['couponReductionPercent'];
    couponQuantity = json['couponQuantity'];
    couponLeftQuantity = json['couponLeftQuantity'];
    couponAvailableDurationInSeconds = json['couponAvailableDurationInSeconds'];
    couponAvailable = json['couponAvailable'];
    couponOnlyForOwner = json['couponOnlyForOwner'];
    couponForBox = json['couponForBox'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['couponName'] = this.couponName;
    data['couponOwner'] = this.couponOwner;
    data['couponReductionPercent'] = this.couponReductionPercent;
    data['couponQuantity'] = this.couponQuantity;
    data['couponLeftQuantity'] = this.couponLeftQuantity;
    data['couponAvailableDurationInSeconds'] =
        this.couponAvailableDurationInSeconds;
    data['couponAvailable'] = this.couponAvailable;
    data['couponOnlyForOwner'] = this.couponOnlyForOwner;
    data['couponForBox'] = this.couponForBox;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
