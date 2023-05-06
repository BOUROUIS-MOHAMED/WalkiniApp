class ReviewModel {
  Null? id;
  int? userId;
  int? reviewedProduct;
  String? reviewValue;
  DateTime? createdAt;
DateTime? modifiedAt;

  ReviewModel(
      {this.id,
        this.userId,
        this.reviewedProduct,
        this.reviewValue,
        this.createdAt,
        this.modifiedAt});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    reviewedProduct = json['reviewedProduct'];
    reviewValue = json['reviewValue'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['reviewedProduct'] = this.reviewedProduct;
    data['reviewValue'] = this.reviewValue;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
