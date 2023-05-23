
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/data_management/api/repository/boxRepo.dart';
import 'package:start_up_project/models/boosts_model.dart';
import 'package:start_up_project/models/coupon_model.dart';

import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/models/place_model.dart';
import 'package:start_up_project/models/test_api_model.dart';


import '../data_management/api/repository/AuthRepo.dart';
import '../models/response_model.dart';

enum BooleanServerAnswer{
  yes,
  no,
  error

}

class BoxController extends GetxController implements GetxService {
  final BoxRepo boxRepo;
  BoxController({required this.boxRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<ResponseModel> openBox(int id ,int userId) async {
    _isLoading = true;

    print("open Box");
    Response response = await boxRepo.openBox(id,userId);
    late ResponseModel responseModel;
    print(response.body);

    if (response.statusCode == 200) {
      if (response.body["thereIsAnError"]) {
        responseModel = ResponseModel(thereIsAnError: true,
            message: response.body["message"],
            object: null);
      }  else{
        String validator=response.body["message"];
        if (validator=="coins") {
          String model=response.body["object"];
          responseModel=ResponseModel(
              message: "Congratulation you earn ${model} coin ,this item added to your wallet",
              thereIsAnError: false,
              object: model,
              returnedBoolean: true
          );
          
        }  else  if (validator=="boosts") {
          BoostModel model=BoostModel.fromJson(response.body["object"]);
          responseModel=ResponseModel(
              message: "Congratulation you earn ${model.name} ,this item added to your wallet",
          thereIsAnError: false,
            object: model,
            returnedBoolean: true
          );
        }  else  if (validator=="coupons") {
          CouponModel model=CouponModel.fromJson(response.body["object"]);
          responseModel=ResponseModel(
              message: "Congratulation you earn ${model.couponName} ,this item added to your wallet",
              thereIsAnError: false,
              object: model,
              returnedBoolean: true
          );
        }  else  if (validator=="places") {
          PlaceModel model=PlaceModel.fromJson(response.body["object"]);
          responseModel=ResponseModel(
              message: "Congratulation you earn ${model.name} ,this item added to your wallet",
              thereIsAnError: false,
              object: model,
              returnedBoolean: true
          );

        }  else {
          responseModel=ResponseModel(
              message: "Error please contact support",
              thereIsAnError: true,
              object: null,
              returnedBoolean: false
          );
        }
        return responseModel;

  }

    } else {
      responseModel = ResponseModel(thereIsAnError: true,message: response.statusText);
    }
    _isLoading = false;
    update();
    print(responseModel.message);
    return responseModel;
  }

}
