import 'dart:ffi';

class ModifiedAttributeModel {
  int? id;
  String? name;
  int? maxStepsLimit;
  Double? stepsMultiplayer;
  int? maxBoxPerDay;
  int? maxVisitPerDay;
  DateTime? createdAt;
DateTime? modifiedAt;

  ModifiedAttributeModel(
      {this.id,
        this.name,
        this.maxStepsLimit,
        this.stepsMultiplayer,
        this.maxBoxPerDay,
        this.maxVisitPerDay,
        this.createdAt,
        this.modifiedAt});

  ModifiedAttributeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    maxStepsLimit = json['maxStepsLimit'];
    stepsMultiplayer = json['stepsMultiplayer'];
    maxBoxPerDay = json['maxBoxPerDay'];
    maxVisitPerDay = json['maxVisitPerDay'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['maxStepsLimit'] = this.maxStepsLimit;
    data['stepsMultiplayer'] = this.stepsMultiplayer;
    data['maxBoxPerDay'] = this.maxBoxPerDay;
    data['maxVisitPerDay'] = this.maxVisitPerDay;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
