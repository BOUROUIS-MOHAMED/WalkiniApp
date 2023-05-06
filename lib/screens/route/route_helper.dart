
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_up_project/BranchScreen.dart';
import 'package:start_up_project/screens/auth/login_screen.dart';
import 'package:start_up_project/screens/auth/signup_screen.dart';
import 'package:start_up_project/screens/home%20Page/home_page.dart';
import 'package:start_up_project/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/PreferenceSettings.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/settings_picker.dart';
import 'package:start_up_project/screens/side%20menu/side_menu.dart';
import 'package:start_up_project/screens/tab%20Bar/mainScreen.dart';


class RouteHelper {

  //Home
  static const String splashPage = "/splash-page";
  static String getSplashPage() => '$splashPage';


  static const String sideMenuPage = "/side-menu-page";
  static String getSideMenuPage() => '$sideMenuPage';

  static const String onBoardingScreen = "/on-boarding-screen";
  static String getOnBoardingScreen() => '$onBoardingScreen';
  static const String branchScreen = "/branch-screen";
  static String getBranchScreen() => '$branchScreen';

  static const String initial = '/';
  static String getInitial() => '$initial';


  //Settings
  static const String settingsMainPage = '/settings-main-page';
  static String getSettingsMainPage() => '$settingsMainPage';
  static const String settingsPickerScreen = '/settings-picker-screen';
  static String getSettingsPickerPage(List items,String pickMessage,String pickTitle,Widget lastPage)
  => '$settingsPickerScreen?items=$items&pickMessage=$pickMessage&pickTitle=$pickTitle&lastPage=$Widget';
  static const String preferencesSettings = '/preferences-settings-page';
  static String getPreferencesPage() => '$preferencesSettings';

  //Auth
  static const String authMainPage = "/auth-main-page";
  static String getAuthMainPage() => '$authMainPage';
  static const String loginPage = "/login-page";
  static String getLoginPage() => '$loginPage';
  static const String signUpNormalUserPage = "/signup-normal-user-page";
  static String getSignUpNormalUserPage() => '$signUpNormalUserPage';
  static const String signUpSpecialUserPage = "/signup-special-user-page";
  static String getSignUpSpecialUserPage() => '$signUpSpecialUserPage';
  static const String forgetPasswordPage = "/forget-password-page";
  static String getFogetPasswordPage() => '$forgetPasswordPage';
  static const String otpSenderPage = "/otp-sender-page";
  static String getOtpSenderPage() => '$otpSenderPage';

  //Auth Additional Information
  static const String birthdayPickerPage = "/birthday-picker-page";
  static String getBirthdayPickerPage() => '$birthdayPickerPage';
  static const String countryPickerPage = "/country-picker-page";
  static String getCountryPickerPage() => '$countryPickerPage';
  static const String heightPickerPage = "/height-picker-page";
  static String getheightPickerPage() => '$heightPickerPage';
  static const String genderPickerPage = "/gender-picker-page";
  static String getGenderPickerPage() => '$genderPickerPage';
  static const String weightPickerPage = "/weight-picker-page";
  static String getWeightPickerPage() => '$weightPickerPage';
  static const String problemsPickerPage = "/problems-picker-page";
  static String getProblemsPickerPage() => '$problemsPickerPage';
  static const String trialVersionPage = "/trial-version-page";
  static String getTrialVersionPage() => '$trialVersionPage';
  static const String loadingPage = "/loading-page";
  static String getLoadingPage() => '$loadingPage';

  //Profile
  static const String profilePage = "/profile-page";
  static String getProfilePage() => '$profilePage';
  //Permissions
  static const String permissionRequestPage = "/permission-request-page";
  static String getPermissionRequestPage() => '$permissionRequestPage';
  //box
  static const String boxPage = "/box-page";
  static String getBoxPage() => '$boxPage';
  static const String unboxPage = "/unbox-page";
  static String getUnboxPage() => '$unboxPage';
  //subscription
  static const String subscriptionReminderPage = "/subscription-reminder-page";
  static String getSubscriptionReminderPage() => '$subscriptionReminderPage';
  static const String presentationPage = '/presentation-page';
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String searchPage = "/search-page";
  static const String signUpUser = "/register-user";
  static const String logInUser = "/login-user";
  static const String signUpSpecialUser = "/register-special-user";
  static const String logInSpecialUser = "/login-special-user";
//////////////////////////////////
  //Home



  static String getPreferencesSettings() => '$preferencesSettings';
  static String getPresentationPage() => '$presentationPage';

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static String getSearchPage() => '$searchPage';

  static String getSettingMainPage(String videoLink) =>
      '$settingsMainPage?videoLink=$videoLink';





  static List<GetPage> routes = [
//Home
  GetPage(
  name: initial,
  page: () => BottomTabBarScreen(),
  transition: Transition.leftToRight),
    GetPage(
        name: branchScreen,
        page: () => BranchScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: onBoardingScreen,
        page: () {
          return OnBoardingScreen();
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: sideMenuPage,
        page: () => SideMenuBar(),
        transition: Transition.leftToRightWithFade),
    //Settings
    GetPage(
        name: settingsMainPage,
        page: () => SettingsMainPage(),
        transition: Transition.leftToRightWithFade),

  ];}
/*
  ,*//*


}


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
}*/*/

