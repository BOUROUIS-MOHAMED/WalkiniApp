class ResponseModel {
  String? message;
  Object? object;
  int? errorCode;
  bool? thereIsAnError;
  String? errorType;

  ResponseModel(
      {this.message,
        this.object,
        this.errorCode,
        this.thereIsAnError,
        this.errorType});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    object = json['object'];
    errorCode = json['errorCode'];
    thereIsAnError = json['thereIsAnError'];
    errorType = json['errorType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['object'] = this.object;
    data['errorCode'] = this.errorCode;
    data['thereIsAnError'] = this.thereIsAnError;
    data['errorType'] = this.errorType;
    return data;
  }
}
