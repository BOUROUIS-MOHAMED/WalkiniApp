
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:start_up_project/constants.dart';

import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/models/test_api_model.dart';


import '../data_management/api/repository/AuthRepo.dart';
import '../models/response_model.dart';

enum BooleanServerAnswer{
  yes,
  no,
  error

}

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<ResponseModel> registration(NormalUserModel profileModel) async {
    _isLoading = true;

    print("registration");
    Response response = await authRepo.registrationOfNormalUser(profileModel);
    late ResponseModel responseModel;
    print(response.body);

    if (response.statusCode == 200) {

NormalUserModel profileModel=NormalUserModel.fromJson(response.body["object"]);
      authRepo.saveUserToken(profileModel.token!);
     await GetStorage().write("profile", profileModel);
     await  GetStorage().write(Constants.TOKEN, profileModel.token);
      responseModel = ResponseModel(thereIsAnError: false,message: response.body["message"],object: profileModel);

    } else {
      responseModel = ResponseModel(thereIsAnError: true,message: response.statusText);
    }
    _isLoading = false;
    update();
    print(responseModel.message);
    return responseModel;
  }


  Future<ResponseModel> uploadProfileImage(File image,String name) async {
    _isLoading = true;
    var response = await authRepo.uploadFile(image,name);
    if (response.errorCode == "200") {
      response.returnedBoolean=true;
      response.thereIsAnError=false;
      } else {
      response.returnedBoolean=false;
      response.thereIsAnError=true;
      print("cant upload image");
    }
    _isLoading = false;
    update();
    return response;
  }

  Future<ResponseModel> login(String email,String phoneNumber, String password) async {

    _isLoading = true;
    Response response = await authRepo.login(email,phoneNumber, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      if (response.body["message"]=="user logged In") {
        NormalUserModel profileModel=NormalUserModel.fromJson(response.body['object']);
        responseModel = ResponseModel(
            thereIsAnError: false,
            message: "user logged",
            object: profileModel);
        GetStorage().write("profile", profileModel);

      } else{
        responseModel = ResponseModel(
            thereIsAnError: true,
            message: response.body['message'],
            object: null);
      }

    } else {
      responseModel = ResponseModel(thereIsAnError: true,message: response.statusText,object: null);
    }
    _isLoading = false;
    update();
    return responseModel;
  }



  Future<BooleanServerAnswer> checkUserExist(String email,String phoneNumber) async {
    _isLoading = true;
    print("check started");
    Response response = await authRepo.checkUserExist(email,phoneNumber);
    late BooleanServerAnswer answer;
    print(response.body);
    if (response.statusCode == 200) {
      if (response.body["message"]=="false") {
        answer= BooleanServerAnswer.no;
      }  else if (response.body["message"]=="true") {
        answer= BooleanServerAnswer.yes;
      }  else {
        answer= BooleanServerAnswer.error;
      }
    }else{
      answer=BooleanServerAnswer.error;}
    _isLoading = false;
    update();
    return answer;
  }

  saveUserNumberAndPassword(String email,String phone, String password) {
    authRepo.saveUserNumberAndPassword(email,phone, password);
  }


  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  Future<bool> clearLocalStorage() {
    return authRepo.clearLocalStorage();
  }
}
