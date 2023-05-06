class StepHistoryModel {
  int? id;
  int? user;
  String? description;
  String? stepsValue;
  String? stepsDay;
  DateTime? createdAt;
DateTime? modifiedAt;

  StepHistoryModel(
      {this.id,
        this.user,
        this.description,
        this.stepsValue,
        this.stepsDay,
        this.createdAt,
        this.modifiedAt});

  StepHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    description = json['description'];
    stepsValue = json['stepsValue'];
    stepsDay = json['stepsDay'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['description'] = this.description;
    data['stepsValue'] = this.stepsValue;
    data['stepsDay'] = this.stepsDay;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
