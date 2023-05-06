import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF202020);
const kPrimaryColor = Color(0xFFFFBD73);
class Constants {
  static const appName="WALKINI";
  static const TOKEN="";
  static const appNameQuote="Walk To Win";
  static const themeModes=["Dark Mode","Light Mode","Automatic"];
  static Offset svgLayersOffset = const Offset(0, -134);
  static Offset svgBackgroundIconsOffst = const Offset(0, 914);
  static Offset svgLayer2IconsOffst = const Offset(0, 126);
  static Offset svgLayer3IconsOffst = const Offset(0, 592);
  static double coinValueInEuro=0.00461;
  static double emeraldValueInEuro=0.00121;



  static const String APP_VERSION = '1.0.0';

  static const String BASE_URL = 'http://192.168.1.8:5000';
  static const String API_VERSION="/api/v1";
  //Profile URI
  static const String REGISTRATION_NORMAL_USER_URI = "${API_VERSION}/profile/createNormalUser";
  static const String LOGIN_NORMAL_USER_URI = "${API_VERSION}/profile/login";
  static const String CHECK_NORMAL_USER_EXIST_URI = "${API_VERSION}/profile/checkUserExist";
  static const String REGISTRATION_OF_THE_PROFILE_ADDITIONAL_INFORMATION="${API_VERSION}/profile/createAdditionalUserInformation";
  static const String BUY_MEMBERSHIP="${API_VERSION}/profile/buyMembership";

  //ProfileType URI
  static const String GET_ALL_PROFILE_TYPE="${API_VERSION}/profileType/getAllProfileType";

  //Ban URI
  static const String GET_ALL_BAN_URI = "${API_VERSION}/ban/getAllBans";
  //Boost URI
  static const String GET_ALL_BOOST_URI = "${API_VERSION}/boost/getAllBoosts";
  static const String SET_BOOST_TO_USER_URI = "${API_VERSION}/boost/setBoostToUser";
  //Box URI
  static const String GET_ALL_BOX_TYPE = "${API_VERSION}/box/getAllBox";
  static const String OPEN_BOX = "${API_VERSION}/box/openBox";
  static const String ADD_BOX_TO_USER = "${API_VERSION}/box/addBoxToUser";
  //CartHistory URI
  static const String CREATE_CART_HISTORY = "${API_VERSION}/cartHistory/createCartHistory";
  //Category URI
  static const String GET_ALL_CATEGORIES = "${API_VERSION}/category/getAllCategories";
  //Charity URI
  static const String GET_ALL_CHARITY = "${API_VERSION}/charity/getAllCharity";
  static const String DONATE_TO_CHARITY= "${API_VERSION}/charity/donateToCharity";
  //Coupon URI
  static const String GET_ALL_COUPONS= "${API_VERSION}/coupon/getAllCoupon";
  static const String USE_COUPON_IN_PRODUCT= "${API_VERSION}/coupon/useCouponInProduct";
  //Inbox URI
  static const String GET_ALL_INBOX= "${API_VERSION}/inbox/getAllInbox";
  static const String MARK_INBOX_AS_SEEN= "${API_VERSION}/inbox/markInboxAsSeen";
  //MembershipType URI
  static const String GET_ALL_MEMBERSHIP_TYPE= "${API_VERSION}/membershipType/getAllMembershipTypes";
  //ModifiedAttribute URI
  static const String GET_ALL_MODIFIED_ATTRIBUTE= "${API_VERSION}/modifiedAttribute/getAllModifiedAttribute";
  //News URI
  static const String GET_ALL_NEWS= "${API_VERSION}/news/getAllNews";
  //Notification URI
  static const String GET_ALL_NOTIFICATION_FOR_USER= "${API_VERSION}/notification/getAllNotificationForUser";
  //PartnerWallet URI
  static const String GET_USER_PARTNER_WALLET= "${API_VERSION}/partnerWallet/getUserPartnerWallet";
  //Place URI
  static const String GET_ALL_PLACES= "${API_VERSION}/place/getAllPlaces";
  static const String CHECK_IF_USER_REACH_THE_POSITION= "${API_VERSION}/place/checkIfUserReachThePosition";
  static const String USER_TAKE_THE_POSITION= "${API_VERSION}/place/userTakeThePosition";
  static const String START_THE_POSITION_COUNTER_FOR_THIS_USER= "${API_VERSION}/place/startThePositionCounterForThisUser";
  //Product URI
  static const String GET_ALL_PRODUCTS= "${API_VERSION}/product/getAllPlaces";
  static const String USER_BUY_THIS_PRODUCT= "${API_VERSION}/product/getAllPlaces";
  static const String REVIEW_THIS_PRODUCT= "${API_VERSION}/product/getAllPlaces";
  //Profile URI
  static const String TEST_URI = "${API_VERSION}/profile/testApi";
  //Rarity URI
  static const String GET_ALL_RARITY = "${API_VERSION}/rarity/getAllRarity";
  //Review
  static const String GET_ALL_ITEM_REVIEW = "${API_VERSION}/review/getAllItemReview";

  //data
  static const String INITIAL_APP_DATA = "${API_VERSION}/initialData/initialAppData";






}