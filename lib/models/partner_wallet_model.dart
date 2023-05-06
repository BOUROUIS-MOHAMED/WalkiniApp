class PartnerWalletModel {
  int? id;
  int? profileType;
  int? userId;
  double? partnerMoney;
  String? soledProducts;
  String? products;
  DateTime? createdAt;
DateTime? modifiedAt;

  PartnerWalletModel(
      {this.id,
        this.profileType,
        this.userId,
        this.partnerMoney,
        this.soledProducts,
        this.products,
        this.createdAt,
        this.modifiedAt});

  PartnerWalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileType = json['profileType'];
    userId = json['userId'];
    partnerMoney = json['partnerMoney'];
    soledProducts = json['soledProducts'];
    products = json['products'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profileType'] = this.profileType;
    data['userId'] = this.userId;
    data['partnerMoney'] = this.partnerMoney;
    data['soledProducts'] = this.soledProducts;
    data['products'] = this.products;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
