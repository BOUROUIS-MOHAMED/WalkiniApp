import 'package:start_up_project/models/action_model.dart';
import 'package:start_up_project/models/badge_model.dart';
import 'package:start_up_project/models/ban_model.dart';
import 'package:start_up_project/models/boosts_model.dart';
import 'package:start_up_project/models/box_model.dart';
import 'package:start_up_project/models/challenge_model.dart';
import 'package:start_up_project/models/charityCategoryModel.dart';
import 'package:start_up_project/models/charity_model.dart';
import 'package:start_up_project/models/coupon_model.dart';
import 'package:start_up_project/models/membership_type_model.dart';
import 'package:start_up_project/models/modified_attribute_model.dart';
import 'package:start_up_project/models/news_model.dart';
import 'package:start_up_project/models/place_model.dart';
import 'package:start_up_project/models/product_category_model.dart';
import 'package:start_up_project/models/product_model.dart';
import 'package:start_up_project/models/rarity_model.dart';
import 'package:start_up_project/models/review_model.dart';
import 'package:start_up_project/models/shop%20models/product.dart';
import 'package:start_up_project/models/shop%20models/product_category.dart';
import 'package:start_up_project/models/workout_model.dart';
import 'package:start_up_project/models/workout_part_model.dart';

class InitialDataModel {
  List<BanModel>? banModels;
  List<RarityModel>? rarityModel;
  List<CouponModel>? couponModels;
  List<WorkoutModel>? workoutModels;
  List<NewsModel>? newsModel;
  List<PlaceModel>? placeModels;
  List<ProductModel>? productModel;
  List<ReviewModel>? reviewModel;
  List<BoxModel>? boxModels;
  List<ChallengeModel>? challengeModels;
  List<BoostModel>? boostModels;
  List<ActionModel>? actionModels;
  List<BadgeModel>? badgeModel;
  List<CharityModel>? charityModels;
  List<WorkoutPartModel>? workoutPartModels;
  List<ProductCategoryModel>? productCategoryModels;
  List<ModifiedAttributeModel>? modifiedAttributeModel;
  List<CharityCategoryModel>? charityCategoriesModels;
  List<MembershipTypeModel>? membershipTypeModel;

  InitialDataModel(
      {this.banModels,
        this.rarityModel,
        this.couponModels,
        this.workoutModels,
        this.newsModel,
        this.placeModels,
        this.productModel,
        this.reviewModel,
        this.boxModels,
        this.challengeModels,
        this.boostModels,
        this.actionModels,
        this.badgeModel,
        this.charityModels,
        this.workoutPartModels,
        this.productCategoryModels,
        this.modifiedAttributeModel,
        this.charityCategoriesModels,
        this.membershipTypeModel});

  InitialDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banModels'] != null) {
      banModels = <BanModel>[];
      json['banModels'].forEach((v) {
        banModels!.add(new BanModel.fromJson(v));
      });
    }
    if (json['rarityModel'] != null) {
      rarityModel = <RarityModel>[];
      json['rarityModel'].forEach((v) {
        rarityModel!.add(new RarityModel.fromJson(v));
      });
    }
    if (json['couponModels'] != null) {
      couponModels = <CouponModel>[];
      json['couponModels'].forEach((v) {
        couponModels!.add(new CouponModel.fromJson(v));
      });
    }
    if (json['workoutModels'] != null) {
      workoutModels = <WorkoutModel>[];
      json['workoutModels'].forEach((v) {
        workoutModels!.add(new WorkoutModel.fromJson(v));
      });
    }
    if (json['newsModel'] != null) {
      newsModel = <NewsModel>[];
      json['newsModel'].forEach((v) {
        newsModel!.add(new NewsModel.fromJson(v));
      });
    }
    if (json['placeModels'] != null) {
      placeModels = <PlaceModel>[];
      json['placeModels'].forEach((v) {
        placeModels!.add(new PlaceModel.fromJson(v));
      });
    }
    if (json['productModel'] != null) {
      productModel = <ProductModel>[];
      json['productModel'].forEach((v) {
        productModel!.add(new ProductModel.fromJson(v));
      });
    }
    if (json['reviewModel'] != null) {
      reviewModel = <ReviewModel>[];
      json['reviewModel'].forEach((v) {
        reviewModel!.add(new ReviewModel.fromJson(v));
      });
    }
    if (json['boxModels'] != null) {
      boxModels = <BoxModel>[];
      json['boxModels'].forEach((v) {
        boxModels!.add(new BoxModel.fromJson(v));
      });
    }
    if (json['challengeModels'] != null) {
      challengeModels = <ChallengeModel>[];
      json['challengeModels'].forEach((v) {
        challengeModels!.add(new ChallengeModel.fromJson(v));
      });
    }
    if (json['boostModels'] != null) {
      boostModels = <BoostModel>[];
      json['boostModels'].forEach((v) {
        boostModels!.add(new BoostModel.fromJson(v));
      });
    }
    if (json['actionModels'] != null) {
      actionModels = <ActionModel>[];
      json['actionModels'].forEach((v) {
        actionModels!.add(new ActionModel.fromJson(v));
      });
    }
    if (json['badgeModel'] != null) {
      badgeModel = <BadgeModel>[];
      json['badgeModel'].forEach((v) {
        badgeModel!.add(new BadgeModel.fromJson(v));
      });
    }
    if (json['charityModels'] != null) {
      charityModels = <CharityModel>[];
      json['charityModels'].forEach((v) {
        charityModels!.add(new CharityModel.fromJson(v));
      });
    }
    if (json['workoutPartModels'] != null) {
      workoutPartModels = <WorkoutPartModel>[];
      json['workoutPartModels'].forEach((v) {
        workoutPartModels!.add(new WorkoutPartModel.fromJson(v));
      });
    }
    if (json['productCategoryModels'] != null) {
      productCategoryModels = <ProductCategoryModel>[];
      json['productCategoryModels'].forEach((v) {
        productCategoryModels!.add(new ProductCategoryModel.fromJson(v));
      });
    }
    if (json['modifiedAttributeModel'] != null) {
      modifiedAttributeModel = <ModifiedAttributeModel>[];
      json['modifiedAttributeModel'].forEach((v) {
        modifiedAttributeModel!.add(new ModifiedAttributeModel.fromJson(v));
      });
    }
    if (json['charityCategoriesModels'] != null) {
      charityCategoriesModels = <CharityCategoryModel>[];
      json['charityCategoriesModels'].forEach((v) {
        charityCategoriesModels!.add(new CharityCategoryModel.fromJson(v));
      });
    }
    if (json['membershipTypeModel'] != null) {
      membershipTypeModel = <MembershipTypeModel>[];
      json['membershipTypeModel'].forEach((v) {
        membershipTypeModel!.add(new MembershipTypeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banModels != null) {
      data['banModels'] = this.banModels!.map((v) => v.toJson()).toList();
    }
    if (this.rarityModel != null) {
      data['rarityModel'] = this.rarityModel!.map((v) => v.toJson()).toList();
    }
    if (this.couponModels != null) {
      data['couponModels'] = this.couponModels!.map((v) => v.toJson()).toList();
    }
    if (this.workoutModels != null) {
      data['workoutModels'] =
          this.workoutModels!.map((v) => v.toJson()).toList();
    }
    if (this.newsModel != null) {
      data['newsModel'] = this.newsModel!.map((v) => v.toJson()).toList();
    }
    if (this.placeModels != null) {
      data['placeModels'] = this.placeModels!.map((v) => v.toJson()).toList();
    }
    if (this.productModel != null) {
      data['productModel'] = this.productModel!.map((v) => v.toJson()).toList();
    }
    if (this.reviewModel != null) {
      data['reviewModel'] = this.reviewModel!.map((v) => v.toJson()).toList();
    }
    if (this.boxModels != null) {
      data['boxModels'] = this.boxModels!.map((v) => v.toJson()).toList();
    }
    if (this.challengeModels != null) {
      data['challengeModels'] =
          this.challengeModels!.map((v) => v.toJson()).toList();
    }
    if (this.boostModels != null) {
      data['boostModels'] = this.boostModels!.map((v) => v.toJson()).toList();
    }
    if (this.actionModels != null) {
      data['actionModels'] = this.actionModels!.map((v) => v.toJson()).toList();
    }
    if (this.badgeModel != null) {
      data['badgeModel'] = this.badgeModel!.map((v) => v.toJson()).toList();
    }
    if (this.charityModels != null) {
      data['charityModels'] =
          this.charityModels!.map((v) => v.toJson()).toList();
    }
    if (this.workoutPartModels != null) {
      data['workoutPartModels'] =
          this.workoutPartModels!.map((v) => v.toJson()).toList();
    }
    if (this.productCategoryModels != null) {
      data['productCategoryModels'] =
          this.productCategoryModels!.map((v) => v.toJson()).toList();
    }
    if (this.modifiedAttributeModel != null) {
      data['modifiedAttributeModel'] =
          this.modifiedAttributeModel!.map((v) => v.toJson()).toList();
    }
    if (this.charityCategoriesModels != null) {
      data['charityCategoriesModels'] =
          this.charityCategoriesModels!.map((v) => v.toJson()).toList();
    }
    if (this.membershipTypeModel != null) {
      data['membershipTypeModel'] =
          this.membershipTypeModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
