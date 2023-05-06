import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/models/profile_additional_information_model.dart';
import 'package:start_up_project/models/profile_model.dart';
import 'package:start_up_project/models/test_api_model.dart';

import '../api_client.dart';


class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({ required this.apiClient,required this.sharedPreferences});


  Future<Response>  registrationTheAdditionalInformation(ProfileAdditionalInformationModel profileAdditionalInformationModel) async{
    return await apiClient.postData(Constants.REGISTRATION_OF_THE_PROFILE_ADDITIONAL_INFORMATION, profileAdditionalInformationModel.toJson());
  }

Future<Response>  registration(ProfileModel profileModel) async{
 return await apiClient.postData(Constants.REGISTRATION_NORMAL_USER_URI, profileModel.toJson());
}
  Future<Response>  checkUserExist(String phone,String email) async{
    print("ici");
    return await apiClient.postData(Constants.CHECK_NORMAL_USER_EXIST_URI,{"phoneNumber":phone,"email":email});
  }



  Future<Response>  login(String email,String phoneNumber,String password) async{
    return await apiClient.postData(Constants.LOGIN_NORMAL_USER_URI, {"email":email,"phoneNumber":email,"password":password});
  }

  //
  getUserToken() async{
  return await GetStorage().read(Constants.TOKEN)??'None';
  }




  //
 bool userLoggedIn() {
    return  GetStorage().hasData(Constants.TOKEN);
  }


Future<void> saveUserToken(String token) async{
  apiClient.token=token;
  apiClient.updateHeader(token);
  return await GetStorage().write(Constants.TOKEN, token);
}
Future<void> saveUserNumberAndPassword(String email,String phone,String password)async {
  try{
    await   GetStorage().write('email',email );
 await   GetStorage().write('phoneNumber',phone );
  await  GetStorage().write('Password', password);

  }catch(e){
    throw e;
  }
}



  Future<bool> clearLocalStorage()async {
    await GetStorage().erase();
    GetStorage().write('OnBoardingScreen', true);
    apiClient.token='';
    apiClient.updateHeader('');

    return true;
  }



}