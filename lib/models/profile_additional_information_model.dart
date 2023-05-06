class ProfileAdditionalInformationModel {
  int? id;
  String? height;
  String? weight;
  String? goals;
  bool? hadProblems;
  String? problems;


  ProfileAdditionalInformationModel(
      {this.id,
        this.height,
        this.weight,
        this.goals,
        this.hadProblems,
      this.problems,
      });

  ProfileAdditionalInformationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    height = json['height'];
    weight = json['weigh'];
    goals = json['goals'];
    hadProblems = json['hadProblems'];
    problems=json["problems"];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['height'] = this.height;
    data['weigth'] = this.weight;
    data['goals'] = this.goals;
    data['hadProblems'] = this.hadProblems;
    data['problems']=this.problems;

    return data;
  }
}
