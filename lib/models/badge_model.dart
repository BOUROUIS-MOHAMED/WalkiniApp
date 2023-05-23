class BadgeModel {
  int? id;
  String? badgeName;
  String? badgeDescription;
  String? badgeImage;
  String? createdAt;
  String? modifiedAt;

  BadgeModel(
      {this.id,
        this.badgeName,
        this.badgeDescription,
        this.badgeImage,
        this.createdAt,
        this.modifiedAt});

  BadgeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    badgeName = json['badgeName'];
    badgeDescription = json['badgeDescription'];
    badgeImage = json['badgeImage'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['badgeName'] = this.badgeName;
    data['badgeDescription'] = this.badgeDescription;
    data['badgeImage'] = this.badgeImage;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
