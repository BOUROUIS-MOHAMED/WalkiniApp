class StepHistoryModel {
  int? id;
  int? user;
  String? log;
  String? stepsValue;
  String? stepsDay;
  String? status;
  String? createdAt;
  String? modifiedAt;

  StepHistoryModel(
      {this.id,
        this.user,
        this.log,
        this.stepsValue,
        this.stepsDay,
        this.status,
        this.createdAt,
        this.modifiedAt});

  StepHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    log = json['log'];
    stepsValue = json['stepsValue'];
    stepsDay = json['stepsDay'];
    status = json['status'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['log'] = this.log;
    data['stepsValue'] = this.stepsValue;
    data['stepsDay'] = this.stepsDay;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
