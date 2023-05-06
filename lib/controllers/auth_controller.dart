import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:start_up_project/models/profile_additional_information_model.dart';
import 'package:start_up_project/models/profile_model.dart';
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


  Future<ResponseModel> registration(ProfileModel profileModel) async {
    _isLoading = true;

    print("registration");
    Response response = await authRepo.registration(profileModel);
    late ResponseModel responseModel;
    print(response.body);

    if (response.statusCode == 200) {
print(response.body["object"]["banDurationInSeconds"].runtimeType);

      ProfileModel profileModel=ProfileModel.fromJson(response.body["object"]);
      authRepo.saveUserToken(profileModel.token!);
      responseModel = ResponseModel(thereIsAnError: false,message: response.body["message"]);

    } else {
      responseModel = ResponseModel(thereIsAnError: true,message: response.statusText);
    }
    _isLoading = false;
    update();
    print(responseModel.message);
    return responseModel;
  }

  Future<ResponseModel> registrationTheAdditionalInformation(ProfileAdditionalInformationModel profileAdditionalInformationModel) async {
    _isLoading = true;
    print("registrationTheAdditionalInformationId");
    Response response = await authRepo.registrationTheAdditionalInformation(profileAdditionalInformationModel);
    late ResponseModel responseModel;
    print(response.body);
    print(response.body["message"]);

    if (response.statusCode == 200) {

      print( response.body["object"].runtimeType);

      ProfileAdditionalInformationModel profileAdditionalInformationModel=ProfileAdditionalInformationModel.fromJson (response.body["object"]);
      responseModel = ResponseModel(thereIsAnError: false,message: profileAdditionalInformationModel.id.toString());

    } else {
      responseModel = ResponseModel(thereIsAnError: true,message: response.statusText);
    }
    _isLoading = false;
    update();
    print(responseModel.message);
    return responseModel;
  }

  Future<ResponseModel> login(String email,String phoneNumber, String password) async {

    _isLoading = true;
    Response response = await authRepo.login(email,phoneNumber, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      if (response.body["message"]=="user logged In") {
        ProfileModel profileModel=ProfileModel.fromJson(response.body['object']);
        responseModel = ResponseModel(
            thereIsAnError: false,
            message: response.body['message'],
            object: response.body['object']);

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
    print(response.body["message"]);
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
