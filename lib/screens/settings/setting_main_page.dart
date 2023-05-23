import 'dart:io';

import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health/health.dart';
import 'package:start_up_project/FAQs_screen.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/screens/settings/about_us_screen.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/apperance%20settings/apparence_settings_page.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/user%20information%20settings/user_information_settings.dart';
import 'package:start_up_project/widgets/showAwesomeSnackBar.dart';

import '../../utils/colors.dart';

class SettingsMainPage extends StatefulWidget {
  const SettingsMainPage({Key? key}) : super(key: key);

  @override
  State<SettingsMainPage> createState() => _SettingsMainPageState();
}

class _SettingsMainPageState extends State<SettingsMainPage> {
NormalUserModel normalUserModel=NormalUserModel();
  initData(){
    normalUserModel=NormalUserModel.fromJson( GetStorage().read(Constants.profileModelKey));
  }
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Padding(

        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            CachedNetworkImage(
              imageUrl: normalUserModel.image??"",
              imageBuilder: (context, imageProvider) =>  BigUserCard(
                backgroundColor: Colors.redAccent.shade100,
                userName: "Bourouis Mohamed",
                userProfilePic: imageProvider,
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Modify",
                  subtitle: "Tap to change your data",
                  onTap: () {
                    print("OK");
                  },
                ),
              ),
              placeholder: (context, url) =>  BigUserCard(
                backgroundColor: Colors.redAccent.shade100,
                userName: "Bourouis Mohamed",
                userProfilePic: AssetImage("assets/avatars/avatar-2.png"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Modify",
                  subtitle: "Tap to change your data",
                  onTap: () {
                    print("OK");
                  },
                ),
              ),
              errorWidget: (context, url, error) => BigUserCard(
                backgroundColor: Colors.redAccent.shade100,
                userName: "Bourouis Mohamed",
                userProfilePic: AssetImage("assets/avatars/avatar-2.png"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Modify",
                  subtitle: "Tap to change your data",
                  onTap: () {
                    print("OK");
                  },
                ),
              ),
            ),
            // User card

            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppearanceSettings(),));
                  },
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(),
                  title: 'Appearance',
                  subtitle: "Make Walkini App yours",
                ),
                SettingsItem(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserInformationSettings(),));
                  },
                  icons: CupertinoIcons.person,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: AppColors.mainColor,
                  ),
                  title: 'User Information',
                  subtitle: "you have a cute face ",
                ),


                SettingsItem(
                  onTap: () {
                    showNormalSnackBar(context, "This feature will come in the next major update", AppColors.purpleColor, Colors.white);
                  },
                  icons: CupertinoIcons.clock,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: AppColors.iconColor2,
                  ),
                  title: 'Hand watch',
                  subtitle: "Give me your hand my sweetie",
                ),

              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    showNormalSnackBar(context, "This tab will redirect you to app page", Colors.red, Colors.white);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage(),));
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About Us',
                  subtitle: "Learn more about Walkini App",
                ),
              ],
            ),
            SettingsGroup(
              settingsGroupTitle: "Application Settings",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.lock_open,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.cyan,
                  ),
                  title: 'Privacy and Security',
                  subtitle: "Hide from me?",

                ),
                SettingsItem(

                  onTap: () {},
                  icons: Icons.notifications_active_outlined,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.black,
                  ),
                  title: 'Notifications and Sounds',
                  subtitle: "do you want me to call you?",

                ),
                SettingsItem(
                  onTap: () {},
                  icons: FontAwesomeIcons.earthEurope,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.blue,
                  ),
                  title: 'Languages',
                  subtitle: "Oh bro ,its your app",

                ),
              ],
            ),
          SettingsGroup(
              settingsGroupTitle: "Membership",
              items: [
              SettingsItem(
              onTap: () {},
        icons: Icons.admin_panel_settings_sharp,
        iconStyle: IconStyle(
          backgroundColor: Colors.brown,
        ),
        title: 'MemberShip Settings',
        subtitle: "UNO DE NOI",


                ),]),





            // You can add a settings title

             SettingsGroup(
                settingsGroupTitle: "Preferences",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: FontAwesomeIcons.ruler,

                    iconStyle: IconStyle(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    title: 'Units',
                    subtitle: "1 mile=1.6 km, your know that right ?",

                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.format_paint_outlined,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    title: 'Colors',
                    subtitle: "Change colors to change life",

                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: FontAwesomeIcons.faceKissWinkHeart,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.green.shade900,
                    ),
                    title: 'Partners',
                    subtitle: "Can you be my valentine ?",
                  ),
                ]),

            //Help Settings
            SettingsGroup(
                settingsGroupTitle: "Help",
                items: [
                  SettingsItem(
                    onTap: () {
                      showNormalSnackBar(context, "This tab will send to to email form", AppColors.yellowColor, Colors.black);
                    },
                    icons: Icons.question_mark_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.pinkAccent,
                    ),
                    title: 'Ask a Question',
                    subtitle: "In your service",

                  ),
                  SettingsItem(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FAQsScreen(),));
                    },
                    icons: Icons.question_answer_outlined,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.orange,
                    ),
                    title: 'FAQ',
                    subtitle: "Find your answer",

                  ),
                  SettingsItem(
                    onTap: () {
                      showNormalSnackBar(context, "this page will redirect you to privacy and policy page when its done", Colors.red, Colors.black);
                    },
                    icons: Icons.local_police_outlined,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.lightGreen,
                    ),
                    title: 'Privacy Policy',
                    subtitle: "Every one have rules ,right ?",

                  ),
                ]),

            //Account Settings
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    showNormalSnackBar(context, "Good by! please come back soon", Colors.black, Colors.white);
                  },
                  icons: Icons.exit_to_app_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.grey,
                  ),
                  title: "Sign Out",
                  subtitle: "Where are you going ?",
                ),
                SettingsItem(
                  onTap: () {
                    showNormalSnackBar(context, "Good by my lover! good by my friend", Colors.black, Colors.white);
                  },
                  icons: CupertinoIcons.delete_solid,
                  title: "DELETE ACCOUNT",
                  subtitle: "We will lost a soldier !",
                  iconStyle: IconStyle(
                    backgroundColor: Colors.blueGrey,
                  ),
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitleStyle: TextStyle(
                    color: Colors.redAccent.withOpacity(0.3),

                  ),
                ),


      ],
      ) ])));


  }
}
