class ChallengeModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? target;
  String? coinPrize;
  String? createdAt;
  String? modifiedAt;

  ChallengeModel(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.target,
        this.coinPrize,
        this.createdAt,
        this.modifiedAt});

  ChallengeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    target = json['target'];
    coinPrize = json['coinPrize'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['target'] = this.target;
    data['coinPrize'] = this.coinPrize;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
