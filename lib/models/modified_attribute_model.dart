class ModifiedAttributeModel {
  int? id;
  String? name;
  int? maxStepsLimit;
  double? stepsMultiplayer;
  int? maxBoxPerDay;
  int? maxVisitPerDay;
  int? maxAskForConvertPerDay;
  String? createdAt;
  String? modifiedAt;

  ModifiedAttributeModel(
      {this.id,
        this.name,
        this.maxStepsLimit,
        this.stepsMultiplayer,
        this.maxBoxPerDay,
        this.maxVisitPerDay,
        this.maxAskForConvertPerDay,
        this.createdAt,
        this.modifiedAt});

  ModifiedAttributeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    maxStepsLimit = json['maxStepsLimit'];
    stepsMultiplayer = json['stepsMultiplayer'];
    maxBoxPerDay = json['maxBoxPerDay'];
    maxVisitPerDay = json['maxVisitPerDay'];
    maxAskForConvertPerDay = json['maxAskForConvertPerDay'];
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
    data['maxAskForConvertPerDay'] = this.maxAskForConvertPerDay;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
