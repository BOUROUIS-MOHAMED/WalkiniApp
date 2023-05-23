import 'dart:io';

import 'package:get/get.dart';
import 'package:start_up_project/utils/enum_helper.dart';

class ResponseModel {
  int? returnedInteger=null;
  String? returnedString=null;
  bool? returnedBoolean=null;
  File? returnedMultipartFile=null;
  List? returnedList=null;
  String? message="";
  Object? object=null;
  bool? thereIsAnError=true;
  String? errorType=ErrorResponseType.Nothing.toString();
  String? errorCode="404";

  ResponseModel(
      {this.returnedInteger,
        this.returnedString,
        this.returnedBoolean,
        this.returnedMultipartFile,
        this.returnedList,
        this.message,
        this.object,
        this.thereIsAnError,
        this.errorType,
        this.errorCode});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    returnedInteger = json['returnedInteger'];
    returnedString = json['returnedString'];
    returnedBoolean = json['returnedBoolean'];
    returnedMultipartFile = json['returnedMultipartFile'];
    if (json['returnedList'] != null) {
      returnedList = <Null>[];
      json['returnedList'].forEach((v) {
        returnedList!.add(v);
      });
    }
    message = json['message'];
    object = json['object'];
    thereIsAnError = json['thereIsAnError'];
    errorType = json['errorType'];
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['returnedInteger'] = this.returnedInteger;
    data['returnedString'] = this.returnedString;
    data['returnedBoolean'] = this.returnedBoolean;
    data['returnedMultipartFile'] = this.returnedMultipartFile;
    if (this.returnedList != null) {
      data['returnedList'] = this.returnedList!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['object'] = this.object;
    data['thereIsAnError'] = this.thereIsAnError;
    data['errorType'] = this.errorType;
    data['errorCode'] = this.errorCode;
    return data;
  }
}
