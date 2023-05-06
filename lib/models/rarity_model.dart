class RarityModel {
  int? id;
  String? rarityColor;
  String? rarityPercent;
  String? rarityLevel;
  DateTime? createdAt;
DateTime? modifiedAt;
  Null? name;

  RarityModel(
      {this.id,
        this.rarityColor,
        this.rarityPercent,
        this.rarityLevel,
        this.createdAt,
        this.modifiedAt,
        this.name});

  RarityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rarityColor = json['rarityColor'];
    rarityPercent = json['rarityPercent'];
    rarityLevel = json['rarityLevel'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rarityColor'] = this.rarityColor;
    data['rarityPercent'] = this.rarityPercent;
    data['rarityLevel'] = this.rarityLevel;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['name'] = this.name;
    return data;
  }
}
