class TestApiModel {
  int? id;
  String? msg;

  TestApiModel({this.id, this.msg});

  TestApiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['msg'] = this.msg;
    return data;
  }
}
