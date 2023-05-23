class CharityModel {
  int? id;
  String? title;
  String? image;
  String? description;
  String? target;
  String? score;
  bool? inEmerald;
  int? category;
  String? currentAmount;
  String? limitDay;
  double? latitude;
  double? longitude;
  int? owner;
  String? createdAt;
  String? modifiedAt;

  CharityModel(
      {this.id,
        this.title,
        this.image,
        this.description,
        this.target,
        this.score,
        this.inEmerald,
        this.category,
        this.currentAmount,
        this.limitDay,
        this.latitude,
        this.longitude,
        this.owner,
        this.createdAt,
        this.modifiedAt});

  CharityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    target = json['target'];
    score = json['score'];
    inEmerald = json['inEmerald'];
    category = json['category'];
    currentAmount = json['currentAmount'];
    limitDay = json['limitDay'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['target'] = this.target;
    data['score'] = this.score;
    data['inEmerald'] = this.inEmerald;
    data['category'] = this.category;
    data['currentAmount'] = this.currentAmount;
    data['limitDay'] = this.limitDay;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
