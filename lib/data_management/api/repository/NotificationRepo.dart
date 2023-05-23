import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/models/initial_data_model.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/models/test_api_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:start_up_project/utils/enum_helper.dart';

import '../../../models/response_model.dart';
import '../api_client.dart';


class NotificationRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  NotificationRepo({ required this.apiClient,required this.sharedPreferences});





  Future<Response>  getAllNotification() async{
    return await apiClient.getData(Constants.GET_ALL_NOTIFICATION);
  }
  Future<Response>  checkUserExist(String phone,String email) async{
    try{
      return await apiClient.postData(Constants.CHECK_NORMAL_USER_EXIST_BY_EMAIL_AND_PHONE_POST_URI,{"phoneNumber":phone,"email":email}).timeout(Duration(seconds: 5));
    }catch(e){
      return(Response(body: "error:server is unreachable",statusCode: 404,));

    }}




  Future<Response>  login(String email,String phoneNumber,String password) async{
    return await apiClient.postData(Constants.LOGIN_NORMAL_USER_POST_URI, {"email":email,"phoneNumber":email,"password":password});
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