class LastModificationDateModel {
  int? id;
  String? lastServerModificationDate;
  String? lastShopItemsModificationDate;
  String? lastCharityModificationDate;
  String? lastWorkoutModificationDate;
  String? lastMainDataModificationDate;

  LastModificationDateModel(
      {this.id,
        this.lastServerModificationDate,
        this.lastShopItemsModificationDate,
        this.lastCharityModificationDate,
        this.lastWorkoutModificationDate,
        this.lastMainDataModificationDate});

  LastModificationDateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastServerModificationDate = json['lastServerModificationDate'];
    lastShopItemsModificationDate = json['lastShopItemsModificationDate'];
    lastCharityModificationDate = json['lastCharityModificationDate'];
    lastWorkoutModificationDate = json['lastWorkoutModificationDate'];
    lastMainDataModificationDate = json['lastMainDataModificationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lastServerModificationDate'] = this.lastServerModificationDate;
    data['lastShopItemsModificationDate'] = this.lastShopItemsModificationDate;
    data['lastCharityModificationDate'] = this.lastCharityModificationDate;
    data['lastWorkoutModificationDate'] = this.lastWorkoutModificationDate;
    data['lastMainDataModificationDate'] = this.lastMainDataModificationDate;
    return data;
  }
}
