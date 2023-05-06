class InboxModel {
  int? id;
  String? title;
  String? content;
  String? image;
  int? firstAction;
  int? secondAction;
  int? collectGiftButtonAction;
  DateTime? createdAt;
DateTime? modifiedAt;
  bool? collected;
  bool? seen;
  bool? gift;

  InboxModel(
      {this.id,
        this.title,
        this.content,
        this.image,
        this.firstAction,
        this.secondAction,
        this.collectGiftButtonAction,
        this.createdAt,
        this.modifiedAt,
        this.collected,
        this.seen,
        this.gift});

  InboxModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    firstAction = json['firstAction'];
    secondAction = json['secondAction'];
    collectGiftButtonAction = json['collectGiftButtonAction'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    collected = json['collected'];
    seen = json['seen'];
    gift = json['gift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['firstAction'] = this.firstAction;
    data['secondAction'] = this.secondAction;
    data['collectGiftButtonAction'] = this.collectGiftButtonAction;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['collected'] = this.collected;
    data['seen'] = this.seen;
    data['gift'] = this.gift;
    return data;
  }
}
