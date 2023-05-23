class WorkoutModel {
  int? id;
  String? workoutName;
  String? workoutMainImage;
  String? workoutParts;
  bool? workoutIsFree;
  bool? priceInEmerald;
  double? workoutPrice;
  String? workoutDescription;
  int? workoutTimeInMinutes;
  String? workoutFocusedBodyPart;
  String? createdAt;
  String? modifiedAt;

  WorkoutModel(
      {this.id,
        this.workoutName,
        this.workoutMainImage,
        this.workoutParts,
        this.workoutIsFree,
        this.priceInEmerald,
        this.workoutPrice,
        this.workoutDescription,
        this.workoutTimeInMinutes,
        this.workoutFocusedBodyPart,
        this.createdAt,
        this.modifiedAt});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workoutName = json['workoutName'];
    workoutMainImage = json['workoutMainImage'];
    workoutParts = json['workoutParts'];
    workoutIsFree = json['workoutIsFree'];
    priceInEmerald = json['priceInEmerald'];
    workoutPrice = json['workoutPrice'];
    workoutDescription = json['workoutDescription'];
    workoutTimeInMinutes = json['workoutTimeInMinutes'];
    workoutFocusedBodyPart = json['workoutFocusedBodyPart'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['workoutName'] = this.workoutName;
    data['workoutMainImage'] = this.workoutMainImage;
    data['workoutParts'] = this.workoutParts;
    data['workoutIsFree'] = this.workoutIsFree;
    data['priceInEmerald'] = this.priceInEmerald;
    data['workoutPrice'] = this.workoutPrice;
    data['workoutDescription'] = this.workoutDescription;
    data['workoutTimeInMinutes'] = this.workoutTimeInMinutes;
    data['workoutFocusedBodyPart'] = this.workoutFocusedBodyPart;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
