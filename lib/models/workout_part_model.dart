class WorkoutPartModel {
  int? id;
  String? workoutPartDescription;
  String? workoutPartVideo;
  String? workoutPartSound;
  String? workoutPartCaloriesBurned;
  int? workoutPartDurationInSeconds;
  String? createdAt;
  String? modifiedAt;

  WorkoutPartModel(
      {this.id,
        this.workoutPartDescription,
        this.workoutPartVideo,
        this.workoutPartSound,
        this.workoutPartCaloriesBurned,
        this.workoutPartDurationInSeconds,
        this.createdAt,
        this.modifiedAt});

  WorkoutPartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workoutPartDescription = json['workoutPartDescription'];
    workoutPartVideo = json['workoutPartVideo'];
    workoutPartSound = json['workoutPartSound'];
    workoutPartCaloriesBurned = json['workoutPartCaloriesBurned'];
    workoutPartDurationInSeconds = json['workoutPartDurationInSeconds'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['workoutPartDescription'] = this.workoutPartDescription;
    data['workoutPartVideo'] = this.workoutPartVideo;
    data['workoutPartSound'] = this.workoutPartSound;
    data['workoutPartCaloriesBurned'] = this.workoutPartCaloriesBurned;
    data['workoutPartDurationInSeconds'] = this.workoutPartDurationInSeconds;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
