class BoxWalletModel {
  int? id;
  int? userId;
  int? boxId;
  int? boxOwnedQuantity;
  DateTime? createdAt;
DateTime? modifiedAt;

  BoxWalletModel(
      {this.id,
        this.userId,
        this.boxId,
        this.boxOwnedQuantity,
        this.createdAt,
        this.modifiedAt});

  BoxWalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    boxId = json['boxId'];
    boxOwnedQuantity = json['boxOwnedQuantity'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['boxId'] = this.boxId;
    data['boxOwnedQuantity'] = this.boxOwnedQuantity;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
