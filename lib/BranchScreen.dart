import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/models/test_api_model.dart';
import 'package:start_up_project/screens/Shop/cart_screen.dart';
import 'package:start_up_project/screens/Shop/favorite_screen.dart';
import 'package:start_up_project/screens/Shop/product_list_screen.dart';
import 'dart:math' as math;

import 'package:start_up_project/screens/auth/auth_main_screen.dart';
import 'package:start_up_project/screens/auth/forgetpw_screen.dart';
import 'package:start_up_project/screens/auth/login_screen.dart';
import 'package:start_up_project/screens/auth/otpSender.dart';
import 'package:start_up_project/screens/auth/signup_screen.dart';
import 'package:start_up_project/screens/auth/special_user_signup_screen.dart';
import 'package:start_up_project/screens/charity/charity%20home/charity_home_screen.dart';
import 'package:start_up_project/screens/charity/donation_screen.dart';
import 'package:start_up_project/screens/charity/search/search_screen.dart';
import 'package:start_up_project/screens/checkout/checkout_screen.dart';
import 'package:start_up_project/screens/home%20Page/home_page.dart';
import 'package:start_up_project/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:start_up_project/screens/on_boarding_screens/subscreens/on_boarding_last_sub_screen.dart';
import 'package:start_up_project/screens/on_boarding_screens/subscreens/on_boarding_second_sub_screen.dart';
import 'package:start_up_project/screens/permissions/permission%20widgets/activity_tracker_permission_widget.dart';
import 'package:start_up_project/screens/permissions/permission%20widgets/location_permission_widget.dart';
import 'package:start_up_project/screens/profile/profil_screen.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/PreferenceSettings.dart';
import 'package:start_up_project/screens/tab%20Bar/mainScreen.dart';
import 'package:start_up_project/screens/tasks/demo.dart';
import 'package:start_up_project/screens/tracker/WorkoutStartScreen.dart';
import 'package:start_up_project/screens/tracker/page_24.dart';
import 'package:start_up_project/screens/tracker/DailyGoalsScreen.dart';
import 'package:start_up_project/screens/tracker/page_27.dart';
import 'package:start_up_project/screens/tracker/TrackerMainScreen.dart';
import 'package:start_up_project/screens/unbox_screen.dart';
import 'package:start_up_project/screens/wallet/WalletScreen.dart';
import 'package:start_up_project/screens/wallet/donate_screen.dart';

import 'controllers/auth_controller.dart';
class BranchScreen extends StatefulWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

List destinationPage=[
  HomePage(),//canceled
  Page24(),
  GoalsDailyList(),
  WorkoutStartScreen(),
  Page27(),
  TrackerMainScreen(),
  BottomTabBarScreen(),
  AuthMainScreen(),
  ForgetPwScreen(),
  LoginScreen(),
  SendOTPScreen(),
  SignUpScreen(),
  ActivityTrackerPermissionWidget(),
  LocationPermissionWidget(),
  SpecialUserSignUpScreen(),
  DonationScreen("50"),
  SearchScreen(),
  CharityHomeScreen(),
  CheckoutScreen(),

  OnBoardingScreen(),
  ProfileScreen(),
  SettingsMainPage(),
  PreferencesSettings(),
  ProductListScreen(),
  FavoriteScreen(),
  CartScreen(),
  AchievementScreen(),
  WalletScreen(),
  UnboxScreen(),
  DonateScreen(name: 'hame', avatar: '1',)



];

class _BranchScreenState extends State<BranchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: IconButton(
          color: Colors.red,

          onPressed: (){
            NormalUserModel testApiModel=NormalUserModel(

            );
            Get.find<AuthController>().registration(testApiModel);
        print('hi');
      }, icon:Icon( Icons.star)),
      backgroundColor: Colors.black,
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: ListView.builder(
          itemCount: destinationPage.length,
          itemBuilder: (context, index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 0.8.sw,
              height: 0.08.sh,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                  ),
                  onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => destinationPage[index],));
                  }, child: Text(
                  destinationPage[index].toString()
              )),
            ),
          );
        },)
      ),
    );
  }
}
