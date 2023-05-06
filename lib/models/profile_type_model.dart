class ProfileTypeModel {
  int? id;
  String? profileTypeName;
  DateTime? createdAt;
DateTime? modifiedAt;

  ProfileTypeModel(
      {this.id, this.profileTypeName, this.createdAt, this.modifiedAt});

  ProfileTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileTypeName = json['profileTypeName'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profileTypeName'] = this.profileTypeName;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
