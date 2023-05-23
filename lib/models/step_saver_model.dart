class stepSaverModel {
  String? steps;
  String? date;
  double? latitude;
  double? longitude;

  stepSaverModel({this.steps, this.date, this.latitude, this.longitude});

  stepSaverModel.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    date = json['date'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['steps'] = this.steps;
    data['date'] = this.date;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}