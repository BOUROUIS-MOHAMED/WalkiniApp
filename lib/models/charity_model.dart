class CharityModel {
  int? id;
  String? title;
  String? image;
  String? amount;
  String? description;
  String? currentAmount;
  DateTime? limitTime;
  int? owner;
  DateTime? createdAt;
DateTime? modifiedAt;

  CharityModel(
      {this.id,
        this.title,
        this.image,
        this.amount,
        this.description,
        this.currentAmount,
        this.limitTime,
        this.owner,
        this.createdAt,
        this.modifiedAt});

  CharityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    amount = json['amount'];
    description = json['description'];
    currentAmount = json['currentAmount'];
    limitTime = json['limitTime'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['currentAmount'] = this.currentAmount;
    data['limitTime'] = this.limitTime;
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
