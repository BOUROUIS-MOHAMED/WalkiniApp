

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = GetStorage().read(Constants.TOKEN) ?? Constants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }


  /*   "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=10, max=1000"*/
  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  getParameter() async {
    return await GetStorage().read('UserCity') ?? '';
  }

  Future<Response> getData(String uri,
      {Map<String, String>? headers,
      String parametre = '',
      bool cityChecker = false}) async {
    var params = {
      "": "$parametre",
    };
    if (cityChecker) {
      String countryBox = GetStorage().read('UserCountry').toString();
      params = {
        "": "$countryBox",
      };
    } else {
      String cityBox = GetStorage().read('UserCity').toString();
      params = {
        "": "$cityBox",
      };
    }
    try {
      Response response =
          await get(uri, headers: headers ?? _mainHeaders, query: params);

      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {

      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> uploadImage(File file,String name,String uri) async{
    var stream= new http.ByteStream(file.openRead());
    stream.cast();
    var length=await file!.length();
    var request= http.MultipartRequest('POST',Uri.parse(uri));
    request.fields['name']=name;
    request.headers['Authorization']="";
    final fileR=await http.MultipartFile.fromPath('image',file.path);
    request.files.add(fileR);
    var response=await request.send();
    if (response.statusCode==200) {
      var responseB = await http.Response.fromStream(response);
      print( responseB.body);
      print(response.reasonPhrase);
      return Response(statusCode: 200, body: "image Uploaded successfully");
    } else{
     return Response(statusCode: response.statusCode, body: response.reasonPhrase);
    }
  }
}
