class NewsModel {
  int? id;
  String? title;
  String? description;
  String? newsImage;
  String? country;
  String? color;
  String? priority;
  bool? sponsored;
  int? action;
  DateTime? createdAt;
  DateTime? modifiedAt;

  NewsModel(
      {this.id,
        this.title,
        this.description,
        this.newsImage,
        this.country,
        this.color,
        this.priority,
        this.sponsored,
        this.action,
        this.createdAt,
        this.modifiedAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    newsImage = json['newsImage'];
    country = json['country'];
    color = json['color'];
    priority = json['priority'];
    sponsored = json['sponsored'];
    action = json['action'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['newsImage'] = this.newsImage;
    data['country'] = this.country;
    data['color'] = this.color;
    data['priority'] = this.priority;
    data['sponsored'] = this.sponsored;
    data['action'] = this.action;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
