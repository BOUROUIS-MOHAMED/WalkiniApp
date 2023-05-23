import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/controllers/initialDataController.dart';
import 'package:start_up_project/controllers/notification_controller.dart';
import 'package:start_up_project/data_management/api/repository/NotificationRepo.dart';
import 'package:start_up_project/data_management/api/repository/initialDataRepo.dart';

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
  Get.lazyPut(
      () => InitialDataRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
          () => NotificationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

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
  Get.lazyPut(() => InitialDataController(dataRepo: Get.find()));
  Get.lazyPut(() => NotificationController(notificationRepo: Get.find()));
}
