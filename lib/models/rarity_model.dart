class RarityModel {
  int? id;
  String? name;
  String? rarityColor;
  double? rarityPercent;
  String? createdAt;
  String? modifiedAt;

  RarityModel(
      {this.id,
        this.name,
        this.rarityColor,
        this.rarityPercent,
        this.createdAt,
        this.modifiedAt});

  RarityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rarityColor = json['rarityColor'];
    rarityPercent = json['rarityPercent'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rarityColor'] = this.rarityColor;
    data['rarityPercent'] = this.rarityPercent;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
