/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_up_project/screens/auth/login_screen.dart';
import 'package:start_up_project/screens/auth/signup_screen.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/PreferenceSettings.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/settings_picker.dart';
import 'package:start_up_project/screens/tab%20Bar/mainScreen.dart';


class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String sideMenuPage = "/side-menu";
  static const String onBoardingScreen = "/on-boarding-screen";
  static const String initial = '/';
  static const String settingsMainPage = '/settings-main-page';
  static const String settingsPickerScreen = '/settings-picker-screen';
  static const String preferencesSettings = '/preferences-settings';
  static const String presentationPage = '/presentation-page';
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String searchPage = "/search-page";
  static const String signUpUser = "/register-user";
  static const String logInUser = "/login-user";
  static const String signUpSpecialUser = "/register-special-user";
  static const String logInSpecialUser = "/login-special-user";
  static const String mapPage = "/map-page";
  static const String place3dViewer = "/place-3d-viewer";

  static const String userInformationPage = "/user-information-page";

//////////////////////////////////details
  static const String fullScreenDetailPage = '/full-screen-detail-page';

//////////////////////////////////
  static String getSplashPage() => '$splashPage';

  static String getPreferencesSettings() => '$preferencesSettings';

  static String getInitial() => '$initial';

  static String getSideMenuPage() => '$sideMenuPage';

  static String getOnboardingScreen() => '$onBoardingScreen';

  static String getPresentationPage() => '$presentationPage';

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static String getSearchPage() => '$searchPage';

  static String getSettingsMainPage(String videoLink) =>
      '$settingsMainPage?videoLink=$videoLink';

 */
/* static String getPlaceDetailPage(int pageId, String source) =>
      '$placeDetailPage?pageId=$pageId&source=$source';*//*


  static String getSignUpUserPage() => '$signUpUser';

  static String getLogInUserPage() => '$logInUser';

  static String getSignUpSpecialUserPage() => '$signUpSpecialUser';

  static String getLogInSpecialUserPage() => '$logInSpecialUser';

  static String getMapPage() => '$mapPage';

  static String getPlace3dViewer(String source, String sound) =>
      '$place3dViewer?source=$source&sound=$sound';

  static String getUserInformationPage() => '$userInformationPage';

//  static String getPaymentPage(String id,int userID)=> '$payment?id=$id&userID=$userID';
  static String getFullScreenDetailPage(int pageId, String source) =>
      '$fullScreenDetailPage?pageId=$pageId&source=$source';

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => MainScreen(),
    ),
    GetPage(
        name: initial,
        page: () => MainScreen(),
        transition: Transition.leftToRight),
    */
/*GetPage(
        name: onBoadingScreen,
        page: () {
          return WelcomeScreen();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: sideMenuPage,
        page: () => SideMenu(),
        transition: Transition.leftToRightWithFade),*//*

    GetPage(
        name: signUpUser,
        page: () {
          return SignUpScreen();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: logInUser,
        page: () {
          return LoginScreen();
        },
        transition: Transition.rightToLeftWithFade),
*/
/*    GetPage(
        name: presentationPage,
        page: () {
          return AppPresentationScreen();
        },
        transition: Transition.rightToLeftWithFade),*//*

    */
/*   GetPage(
        name: videoPlayerPage,

        page: () {

          return VideoPlayerPage();
        },
        transition: Transition.rightToLeftWithFade),*//*

    GetPage(
        name: settingsMainPage,
        page: () {

          return SettingsMainPage();
        },
        transition: Transition.rightToLeftWithFade),
   */
/* GetPage(
        name: place3dViewer,
        page: () {
          String? source = Get.parameters['source'];
          String? sound = Get.parameters['sound'];
          return Place3dViewer(
            source: source!,
            sound: sound!,
          );
        },
        transition: Transition.rightToLeftWithFade),
*//*

    */
/*  GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.rightToLeftWithFade),*//*

   */
/* GetPage(
        name: mapPage,
        page: () {
          return MapPage();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: userInformationPage,
        page: () {
          //     PickAddressMap _pickAddress = Get.arguments;
          return UserInformation();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: searchPage,
        page: () {
          return SearchPage();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: fullScreenDetailPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          var source = Get.parameters['source'];
          return FullScreenDetailPage(
              pageId: int.parse(pageId!), source: source!);
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: placeDetailPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          var source = Get.parameters['source'];
          return PlaceDetailScreen(pageId: int.parse(pageId!), source: source!);
        }),*//*

    GetPage(
        name: preferencesSettings,
        page: () {

          return PreferencesSettings();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: settingsPickerScreen,
        page: () {
          var lastPage = Get.parameters['lastPage'];
          var pickTitle = Get.parameters['pickTitle'];
          var pickMessage = Get.parameters['pickMessage'];
          List items = Get.parameters['items'];
          return SettingsPickerScreen(
            lastPage:MaterialPageRoute(builder: (context) => lastPage,) ,
              pickTitle: pickTitle!,
              pickMessage: pickMessage!,
              items: items,


              CategorieName: CategorieName!);
        },
        transition: Transition.rightToLeftWithFade),

    */
/*  GetPage(
        name: payment,
        page: () {
          return PaymentPage(
              orderModel:OrderModel(
                  id: int.parse(Get.parameters['id']!),
                  userId:int.parse(Get.parameters['userID']!
                  )));},
        transition: Transition.rightToLeftWithFade),
    GetPage(name: orderSuccess,page: ()=>OrderSuccessPage(
      orderID:Get.parameters['id']!,status:Get.parameters['status'].toString().contains('success')?1:0,

    ))*//*

  ];
}
*/
