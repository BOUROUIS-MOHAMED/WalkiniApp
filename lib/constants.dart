import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_up_project/data_management/api/repository/AuthRepo.dart';


const kBackgroundColor = Color(0xFF202020);
const kPrimaryColor = Color(0xFFFFBD73);
class Constants {
  static const appName="WALKINI";
  static const TOKEN="token";
  static const appNameQuote="Walk To Win";
  static const themeModes=["Dark Mode","Light Mode","Automatic"];
  static Offset svgLayersOffset = const Offset(0, -134);
  static Offset svgBackgroundIconsOffst = const Offset(0, 914);
  static Offset svgLayer2IconsOffst = const Offset(0, 126);
  static Offset svgLayer3IconsOffst = const Offset(0, 592);
  static double coinValueInEuro=0.00461;
  static double emeraldValueInEuro=0.00121;
  static var bottomTabBarHeight=0.08.sh;



  static const String APP_VERSION = '1.0.0';
  static const String BASE_URL = 'http://192.168.1.8:5000';
  static const String API_VERSION="/api/v1";


  //Action URI
  static const String GET_ALL_ACTION_GET_URI="${API_VERSION}/action/getAllAction";
  static const String CREATE_NEW_ACTION_POST_URI="${API_VERSION}/action/createAction";
  static const String UPDATE_ACTION_PUT_URI="${API_VERSION}/action/updateAction";
  static const String DELETE_ACTION_DELETE_URI="${API_VERSION}/action/deleteAction";

  //Badge URI
  static const String GET_ALL_BADGE_GET_URI="${API_VERSION}/badge/getAllBadges";
  static const String CREATE_NEW_BADGE_POST_URI="${API_VERSION}/badge/createBadges";
  static const String UPDATE_BADGE_PUT_URI="${API_VERSION}/badge/updateBadge";
  static const String DELETE_BADGE_DELETE_URI="${API_VERSION}/badge/deleteBadge";
  static const String SET_BADGE_TO_USER_POST_URI="${API_VERSION}/badge/setBadgeToUser";
  static const String REMOVE_BADGE_TO_USER_POST_URI="${API_VERSION}/badge/removeBadgeToUser";

  //BAN URI
  static const String GET_ALL_BAN_GET_URI="${API_VERSION}/ban/getAllBans";
  static const String CREATE_NEW_BAN_POST_URI="${API_VERSION}/ban/createABan";
  static const String UPDATE_BAN_PUT_URI="${API_VERSION}/ban/updateBan";
  static const String DELETE_BAN_DELETE_URI="${API_VERSION}/ban/deleteBan";
  static const String GIVE_BAN_TO_USER_POST_URI="${API_VERSION}/ban/giveUserABan";
  static const String REMOVE_BAN_TO_USER_POST_URI="${API_VERSION}/ban/removeUserBan";

  //Boost URI
  static const String GET_ALL_BOOST_GET_URI="${API_VERSION}/boost/getAllBoosts";
  static const String CREATE_NEW_BOOST_POST_URI="${API_VERSION}/boost/createBoost";
  static const String UPDATE_BOOST_PUT_URI="${API_VERSION}/boost/updateBoost";
  static const String DELETE_BOOST_DELETE_URI="${API_VERSION}/boost/deleteBoost";
  static const String GIVE_BOOST_TO_USER_POST_URI="${API_VERSION}/boost/setBoostToUser";
  static const String REMOVE_BOOST_TO_USER_POST_URI="${API_VERSION}/boost/removeBoostToUser";

  //Place URI
  static const String GET_ALL_PLACE_GET_URI="${API_VERSION}/place/getAllPlaces";
  static const String CREATE_NEW_PLACE_POST_URI="${API_VERSION}/place/createPlace";
  static const String UPDATE_PLACE_PUT_URI="${API_VERSION}/place/updatePlace";
  static const String DELETE_PLACE_DELETE_URI="${API_VERSION}/place/deletePlace";
  static const String SCAN_USER_QRCODE_POST_URI="${API_VERSION}/place/scanQrCodeByPlaceOwner";
  static const String START_PLACE_TRACKING_COUNTER_TO_USER_POST_URI="${API_VERSION}/place/startThePositionCounterForThisUser";
  static const String GIVE_PLACE_TO_USER_POST_URI="${API_VERSION}/place/setPlaceToUser";
  static const String REMOVE_PLACE_TO_USER_POST_URI="${API_VERSION}/place/removePlaceToUser";

  //Box URI
  static const String GET_ALL_BOX_GET_URI="${API_VERSION}/box/getAllBox";
  static const String CREATE_NEW_BOX_POST_URI="${API_VERSION}/box/createBox";
  static const String UPDATE_BOX_PUT_URI="${API_VERSION}/box/updateBox";
  static const String DELETE_BOX_DELETE_URI="${API_VERSION}/box/deleteBox";
  static const String OPEN_BOX_POST_URI="${API_VERSION}/box/openBox";

  //Category URI
  static const String GET_ALL_PRODUCT_CATEGORIES_GET_URI="${API_VERSION}/category/getAllProductCategories";
  static const String CREATE_NEW_PRODUCT_CATEGORY_POST_URI="${API_VERSION}/category/createProductCategory";
  static const String UPDATE_PRODUCT_CATEGORY_PUT_URI="${API_VERSION}/category/updateProductCategory";
  static const String DELETE_PRODUCT_CATEGORY_DELETE_URI="${API_VERSION}/category/deleteProductCategory";
  static const String GET_ALL_CHARITY_CATEGORIES_GET_URI="${API_VERSION}/category/getAllCharityCategories";
  static const String CREATE_NEW_CHARITY_CATEGORY_POST_URI="${API_VERSION}/category/createCharityCategory";
  static const String UPDATE_CHARITY_CATEGORY_PUT_URI="${API_VERSION}/category/updateCharityCategory";
  static const String DELETE_CHARITY_CATEGORY_DELETE_URI="${API_VERSION}/category/deleteCharityCategory";

  //Challenge URI
  static const String GET_ALL_CHALLENGE_GET_URI="${API_VERSION}/challenge/getAllChallenges";
  static const String CREATE_NEW_CHALLENGE_POST_URI="${API_VERSION}/challenge/createChallenge";
  static const String UPDATE_CHALLENGE_PUT_URI="${API_VERSION}/challenge/updateChallenge";
  static const String DELETE_CHALLENGE_DELETE_URI="${API_VERSION}/challenge/deleteChallenge";

  //Charity URI
  static const String GET_ALL_CHARITY_GET_URI="${API_VERSION}/charity/getAllCharity";
  static const String GET_ALL_CHARITY_DEMAND_GET_URI="${API_VERSION}/charity/getAllCharityDemand";
  static const String CREATE_NEW_CHARITY_CREATION_DEMAND_POST_URI="${API_VERSION}/charity/createCharity";
  static const String CREATE_NEW_CHARITY_UPDATE_DEMAND_PUT_URI="${API_VERSION}/charity/updateProduct";
  static const String ACCEPT_NEW_CHARITY_CREATION_DEMAND_POST_URI="${API_VERSION}/charity/acceptAddCharity";
  static const String ACCEPT_NEW_CHARITY_UPDATE_DEMAND_PUT_URI="${API_VERSION}/charity/acceptUpdateCharity";
  static const String DELETE_CHARITY_DELETE_URI="${API_VERSION}/charity/deleteCharity";
  static const String REFUSE_CHARITY_DEMAND_DELETE_URI="${API_VERSION}/charity/refuseCreateOrDeleteCharityDemand";

  //LastModification URI
  static const String GET_SHOULD_I_DOWNLOAD_APP_DATA_GET_URI="${API_VERSION}/modificationDetector/getShouldIDownloadAppData";
  static const String GET_LAST_MODIFICATION_DATE_GET_URI="${API_VERSION}/modificationDetector/getLastModificationDate";
  static const String SET_LAST_MODIFICATION_DATE_POST_URI="${API_VERSION}/modificationDetector/setLastModificationDate";

  //Coupon URI
  static const String GET_ALL_COUPON_GET_URI="${API_VERSION}/coupon/getAllCoupon";
  static const String CREATE_NEW_COUPON_POST_URI="${API_VERSION}/coupon/createCoupon";
  static const String UPDATE_COUPON_PUT_URI="${API_VERSION}/coupon/updateCoupon";
  static const String DELETE_COUPON_DELETE_URI="${API_VERSION}/coupon/deleteCoupon";

  //Membership URI
  static const String GET_ALL_MEMBERSHIP_GET_URI="${API_VERSION}/membershipType/getAllMembershipTypes";
  static const String CREATE_NEW_MEMBERSHIP_POST_URI="${API_VERSION}/membershipType/createMembershipType";
  static const String UPDATE_MEMBERSHIP_PUT_URI="${API_VERSION}/membershipType/updateMembershipType";
  static const String DELETE_MEMBERSHIP_DELETE_URI="${API_VERSION}/membershipType/deleteMembershipType";

  //ModifiedAttribute URI
  static const String GET_ALL_MODIFIED_ATTRIBUTE_GET_URI="${API_VERSION}/modifiedAttribute/getAllModifiedAttribute";
  static const String CREATE_NEW_MODIFIED_ATTRIBUTE_POST_URI="${API_VERSION}/modifiedAttribute/createModifiedAttribute";
  static const String UPDATE_MODIFIED_ATTRIBUTE_PUT_URI="${API_VERSION}/modifiedAttribute/updateModifiedAttribute";
  static const String DELETE_MODIFIED_ATTRIBUTE_DELETE_URI="${API_VERSION}/modifiedAttribute/deleteModifiedAttribute";

  //News URI
  static const String GET_ALL_NEWS_GET_URI="${API_VERSION}/news/getAllNews";
  static const String CREATE_NEW_NEWS_POST_URI="${API_VERSION}/news/createNews";
  static const String UPDATE_NEWS_PUT_URI="${API_VERSION}/news/updateNews";
  static const String DELETE_NEWS_DELETE_URI="${API_VERSION}/news/deleteNews";

  //Shop URI
  static const String UPDATE_PRODUCT_SELL_STATUS_POST_URI="${API_VERSION}/product/updateProductSellStatus";
  static const String BUY_PRODUCT__POST_URI="${API_VERSION}/product/BuyProduct";
  static const String GET_ALL_PRODUCT_GET_URI="${API_VERSION}/product/getAllProducts";
  static const String GET_ALL_PRODUCT_DEMAND_GET_URI="${API_VERSION}/product/getAllWaitingProducts";
  static const String GET_ALL_SELL_PRODUCT_DEMAND_GET_URI="${API_VERSION}/product/getAllWaitingSellProducts";
  static const String GET_ALL_PRODUCT_SELL_HISTORY_GET_URI="${API_VERSION}/product/getAllShopHistory";
  static const String CREATE_NEW_PRODUCT_CREATION_DEMAND_POST_URI="${API_VERSION}/product/createProduct";
  static const String CREATE_NEW_PRODUCT_UPDATE_DEMAND_PUT_URI="${API_VERSION}/product/updateProduct";
  static const String ACCEPT_NEW_PRODUCT_CREATION_DEMAND_POST_URI="${API_VERSION}/product/acceptAddProduct";
  static const String ACCEPT_NEW_PRODUCT_UPDATE_DEMAND_PUT_URI="${API_VERSION}/product/acceptUpdateProduct";
  static const String DELETE_PRODUCT_DELETE_URI="${API_VERSION}/product/deleteProduct";
  static const String REFUSE_PRODUCT_DEMAND_DELETE_URI="${API_VERSION}/product/refuseProductManagementDemand";

  //Profile URI
  static const String REGISTRATION_NORMAL_USER_POST_URI = "${API_VERSION}/profile/createNormalUser";
  static const String LOGIN_NORMAL_USER_POST_URI = "${API_VERSION}/profile/loginNormalUser";
  static const String CHECK_NORMAL_USER_EXIST_BY_EMAIL_AND_PHONE_POST_URI = "${API_VERSION}/profile/checkUserExist";
  static const String CHECK_NORMAL_USER_EXIST_BY_ID_GET_URI = "${API_VERSION}/profile/checkNormalUserExistById";
  static const String GET_ALL_NORMAL_USER_GET_URI="${API_VERSION}/profile/getAllNormalUsers";
  static const String CREATE_NEW_NORMAL_USER_URI="${API_VERSION}/profile/createNormalUser";
  static const String UPDATE_NORMAL_USER_PUT_URI="${API_VERSION}/profile/updateNormalUser";
  static const String DELETE_NORMAL_USER__DELETEURI="${API_VERSION}/profile/deleteNormalUser";

  static const String LOGIN_PARTNER_POST_URI = "${API_VERSION}/profile/loginPartner";
  static const String GET_ALL_PARTNER_GET_URI="${API_VERSION}/profile/getAllPartners";
  static const String CREATE_NEW_PARTNER_USER_URI="${API_VERSION}/profile/createPartner";
  static const String UPDATE_PARTNER_PUT_URI="${API_VERSION}/profile/updatePartner";
  static const String ACTIVATE_PARTNER_ACCOUNT_PUT_URI="${API_VERSION}/profile/activatePartnerAccount";
  static const String DELETE_PARTNER_DELETE_URI="${API_VERSION}/profile/deletePartner";

  static const String LOGIN_ASSOCIATION_POST_URI = "${API_VERSION}/profile/loginAssociation";
  static const String GET_ALL_ASSOCIATION_GET_URI="${API_VERSION}/profile/getAllAssociation";
  static const String CREATE_NEW_ASSOCIATION_USER_URI="${API_VERSION}/profile/createAssociation";
  static const String UPDATE_ASSOCIATION_PUT_URI="${API_VERSION}/profile/updateAssociation";
  static const String ACTIVATE_ASSOCIATION_ACCOUNT_PUT_URI="${API_VERSION}/profile/activateAssociationAccount";
  static const String DELETE_ASSOCIATION_DELETE_URI="${API_VERSION}/profile/deleteAssociation";


  //Rarity URI
  static const String GET_ALL_RARITY_GET_URI="${API_VERSION}/rarity/getAllRarity";
  static const String CREATE_NEW_RARITY_POST_URI="${API_VERSION}/rarity/createRarity";
  static const String UPDATE_RARITY_PUT_URI="${API_VERSION}/rarity/updateRarity";
  static const String DELETE_RARITY_DELETE_URI="${API_VERSION}/rarity/deleteRarity";

  //Review URI
  static const String GET_ALL_REVIEWS_GET_URI="${API_VERSION}/review/getAllReviews";
  static const String GET_THIS_PRODUCT_REVIEWS_GET_URI="${API_VERSION}/review/getThisProductReview";
  static const String GET_THIS_USER_REVIEWS_GET_URI="${API_VERSION}/review/getThisUserReviews";
  static const String REVIEW_THIS_PRODUCT_POST_URI="${API_VERSION}/review/reviewThisProduct";
  static const String DELETE_REVIEW_DELETE_URI="${API_VERSION}/review/deleteReview";

  //Workout URI

  static const String GET_ALL_WORKOUT_GET_URI="${API_VERSION}/workout/getAllWorkouts";
  static const String CREATE_NEW_WORKOUT_POST_URI="${API_VERSION}/workout/createWorkout";
  static const String SET_WORKOUT_TO_USER_POST_URI="${API_VERSION}/workout/setWorkoutToUser";
  static const String REMOVE_WORKOUT_TO_USER_POST_URI="${API_VERSION}/workout/removeWorkoutToUser";
  static const String UPDATE_WORKOUT_PUT_URI="${API_VERSION}/workout/updateWorkout";
  static const String DELETE_WORKOUT_DELETE_URI="${API_VERSION}/workout/deleteWorkout";

  static const String GET_ALL_WORKOUT_PART_GET_URI="${API_VERSION}/workout/getAllWorkoutParts";
  static const String CREATE_NEW_WORKOUT_PART_POST_URI="${API_VERSION}/workout/createWorkoutParts";
  static const String UPDATE_WORKOUT_PART_PUT_URI="${API_VERSION}/workout/updateWorkoutPart";
  static const String DELETE_WORKOUT_PART_DELETE_URI="${API_VERSION}/workout/deleteWorkoutPart";

  //InitData URI
  static const String INITIAL_APP_DATA_GET_URI="${API_VERSION}/initialData/initialAppData";
  static const String INITIAL_MAIN_DATA_GET_URI="${API_VERSION}/initialData/initialMainData";


  //Test URI
  static const String TEST_URI = "${API_VERSION}/profile/testApi";
  //Rarity URI

  //File URI
  static const String SAVE_PROFILE_IMAGE="${API_VERSION}/file/uploadProfileImageToFileSystem";


  //Notification
  static const String GET_ALL_NOTIFICATION="${API_VERSION}/notification/getAllNotification";



  //GetStorage keys
  static const userAlreadyOpenTheAppForTheFirstTimeKey="userAlreadyOpenTheAppForTheFirstTimeKey";
  static const userProfileImagePath="userProfileImagePath";
  static const userIsPremium="userIsPremium";
  static const stepsCounterValue="stepsCounterValue";
  static const firstTimeEnterTheHomePage="firstTimeEnterTheHomePage";
  static const initialStepCounterValue="initialStepCounter";
  static const initialStepCounterDate="initialStepCounter";
  static const totalStepsUntilTheLastDay="totalStepsUntilTheLastDay";
  static const mainUnitKey="mainUnitKey";
  static const profileModelKey="profileModelKey";
  static const notificationListKey="notificationListKey";
  static const counterActivationSwitcherKey="counterActivationSwitcherKey";
  static const lastNotificationIdKey="lastNotificationIdKey";



  //GetStorage Data Keys
static const boxModelKey="boxModelKey";



}