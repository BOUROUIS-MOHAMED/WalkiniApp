import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}
