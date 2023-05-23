
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/data_management/api/repository/NotificationRepo.dart';

import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/models/notification_model.dart';
import 'package:start_up_project/models/test_api_model.dart';
import 'package:start_up_project/noti.dart';


import '../data_management/api/repository/AuthRepo.dart';
import '../models/response_model.dart';

enum BooleanServerAnswer{
  yes,
  no,
  error

}

class NotificationController extends GetxController implements GetxService {
  final NotificationRepo notificationRepo;
  NotificationController({required this.notificationRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<NotificationModel?> getNotification() async {
    Response response = await notificationRepo.getAllNotification();

    if (response.statusCode == 200) {
      List notificationModelList=(response.body["object"]);

      await GetStorage().write(Constants.notificationListKey, notificationModelList);
     int lastId= await GetStorage().read(Constants.lastNotificationIdKey)??0;
     if (notificationModelList.isNotEmpty) {
       NotificationModel lastNotification=NotificationModel.fromJson(notificationModelList.last);
       if (lastNotification.id==lastId) {
        return null;
       }  else{

        await GetStorage().write(Constants.lastNotificationIdKey, lastNotification.id!);
         return lastNotification;
       }
     } else{
       return null;}


    } else {
      return null;}

    update();


  }


}
