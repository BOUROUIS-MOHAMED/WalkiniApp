import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_up_project/constants.dart';

import '../controllers/auth_controller.dart';
import '../data_management/api/api_client.dart';
import '../data_management/api/repository/AuthRepo.dart';


Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: Constants.BASE_URL, sharedPreferences: Get.find()));

  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

//
//
//
//
//
//
//
//
//Controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));

}
