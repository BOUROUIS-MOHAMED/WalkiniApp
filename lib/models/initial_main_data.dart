import 'package:start_up_project/models/boosts_model.dart';
import 'package:start_up_project/models/box_model.dart';
import 'package:start_up_project/models/challenge_model.dart';
import 'package:start_up_project/models/coupon_model.dart';
import 'package:start_up_project/models/place_model.dart';

class InitialMainDataModel {
  List<CouponModel>? couponModel;
  List<BoostModel>? boostModel;
  List<PlaceModel>? placesModel;
  List<BoxModel>? boxModel;
  List<ChallengeModel>? challengeModel;

  InitialMainDataModel(
      {this.couponModel,
        this.boostModel,
        this.placesModel,
        this.boxModel,
        this.challengeModel});

  InitialMainDataModel.fromJson(Map<String, dynamic> json) {
    if (json['couponModel'] != null) {
      couponModel = <CouponModel>[];
      json['couponModel'].forEach((v) {
        couponModel!.add(new CouponModel.fromJson(v));
      });
    }
    if (json['boostModel'] != null) {
      boostModel = <BoostModel>[];
      json['boostModel'].forEach((v) {
        boostModel!.add(new BoostModel.fromJson(v));
      });
    }
    if (json['placesModel'] != null) {
      placesModel = <PlaceModel>[];
      json['placesModel'].forEach((v) {
        placesModel!.add(new PlaceModel.fromJson(v));
      });
    }
    if (json['boxModel'] != null) {
      boxModel = <BoxModel>[];
      json['boxModel'].forEach((v) {
        boxModel!.add(new BoxModel.fromJson(v));
      });
    }
    if (json['challengeModel'] != null) {
      challengeModel = <ChallengeModel>[];
      json['challengeModel'].forEach((v) {
        challengeModel!.add(new ChallengeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.couponModel != null) {
      data['couponModel'] = this.couponModel!.map((v) => v.toJson()).toList();
    }
    if (this.boostModel != null) {
      data['boostModel'] = this.boostModel!.map((v) => v.toJson()).toList();
    }
    if (this.placesModel != null) {
      data['placesModel'] = this.placesModel!.map((v) => v.toJson()).toList();
    }
    if (this.boxModel != null) {
      data['boxModel'] = this.boxModel!.map((v) => v.toJson()).toList();
    }
    if (this.challengeModel != null) {
      data['challengeModel'] =
          this.challengeModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
