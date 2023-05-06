class PlaceWalletModel {
  int? id;
  int? userId;
  int? placesId;
  int? placesOwnedQuantity;
  DateTime? createdAt;
DateTime? modifiedAt;

  PlaceWalletModel(
      {this.id,
        this.userId,
        this.placesId,
        this.placesOwnedQuantity,
        this.createdAt,
        this.modifiedAt});

  PlaceWalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    placesId = json['placesId'];
    placesOwnedQuantity = json['placesOwnedQuantity'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['placesId'] = this.placesId;
    data['placesOwnedQuantity'] = this.placesOwnedQuantity;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
