class ProductCategoryModel {
  int? id;
  String? categoryName;
  String? icon;
  String? createdAt;
  String? modifiedAt;

  ProductCategoryModel(
      {this.id, this.categoryName, this.icon, this.createdAt, this.modifiedAt});

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    icon = json['icon'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['icon'] = this.icon;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
