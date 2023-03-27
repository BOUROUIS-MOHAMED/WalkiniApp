
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/settings_picker.dart';

import '../../setting_main_page.dart';


class UserInformationSettings extends StatefulWidget {

  const UserInformationSettings({
    Key? key,
  }) : super(key: key);

  @override
  State<UserInformationSettings> createState() =>
      _UserInformationSettingsState();
}

class _UserInformationSettingsState
    extends State<UserInformationSettings> {


  bool handicap = false;
  bool useForAnalystic=true;
  bool shareData=true;
  bool specificAds=true;



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(

          leading: GestureDetector(
              onTap:()=>   Navigator.of(context).push(
                  PageTransition(
                      type: PageTransitionType.leftToRightWithFade,

                      childCurrent: this.widget,
                      child: SettingsMainPage())),
              child: Icon(CupertinoIcons.chevron_left,color: Colors.black,)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        body: SettingsList(
          contentPadding: EdgeInsets.only(top: 0.05.sh),
          platform: DevicePlatform.iOS,
          sections: [
            SettingsSection(
              title: Text('ACCOUNT INFORMATION'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Username'),
                  value: Text('mohamed'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.mail_outline_sharp),
                  title: Text('Email',overflow: TextOverflow.ellipsis,),
                  value: Text('moha.amine.bou@gmail.com',overflow: TextOverflow.ellipsis,),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                  value: Text('94970082'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.password_rounded),
                  title: Text('Password'),
                  onPressed: (context) {
                    YYAlertDialogWithDivider(
                        "password",
                        "Change your Password",
                        "Confirm", "Cancel",
                            () {
                    },
                            () { });
                  },

                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.devices_other),
                  title: Text('Platform'),

                ),

              ],
            ),
            SettingsSection(
              title: Text('More INFORMATION'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.person),
                  title: Text('Gender'),
                  value: Text('male'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.cake_outlined),
                  title: Text('BirthDay'),
                  value: Text('18/12/2000'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.height),
                  title: Text('Length'),
                  value: Text('161cm'),
                ),
                SettingsTile.navigation(
                  leading: Icon(FontAwesomeIcons.weightHanging),
                  title: Text('Weight'),
                  value: Text('81Kg'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.flag_outlined),
                  title: Text('Country'),
                  value: Text('Tunisia'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text('Locations'),
                ),


                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      handicap = value;
                    });
                  },
                  initialValue: handicap,
                  leading: Icon(Icons.format_paint),
                  title: Text('have physical problem?'),
                ),
              ],
            ),

            SettingsSection(
              title: Text('ACCOUNT MANAGEMENT'),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: useForAnalystic,
                  leading: Icon(Icons.analytics_outlined),
                  title: Text('Use data in analystic purpose'),
                  description: Text(
                    'Allow us to use some cockies data for analystic purpose',
                  ),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: shareData,
                  leading: Icon(Icons.share_rounded),
                  title: Text('share data with companys'),
                  description: Text(
                    'Allow us to share some historic data with our partners to give you better experience ',
                  ),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: specificAds,
                  leading: Icon(Icons.ads_click),
                  title: Text('Custom ads'),
                  description: Text(
                    'Allow us to give your specific ads by using some of your ads data ',
                  ),
                ),
                SettingsTile.navigation(
                  leading: Icon(CupertinoIcons.restart),
                  title: Text('Reset Data'),
                ),
                SettingsTile.navigation(
                  leading: Icon(CupertinoIcons.trash_fill),
                  title: Text('Delete Data'),
                ),
                SettingsTile.navigation(
                  leading: Icon(CupertinoIcons.clear),
                  title: Text('Delete Account',style: TextStyle(
                    color: Colors.red
                  ),),

                ),


              ],
            ),

          ],
        ),
      ),
    );
  }

  YYDialog YYAlertDialogWithDivider(
      String saveTag,
      String title,
      String acceptButton,
      String refuseButton,
      VoidCallback refuseFunction,
      VoidCallback acceptFunction,

      ) {
    TextEditingController textEditingController=TextEditingController();
    YYDialog dialog =YYDialog().build()
      ..width = 0.5.sw
      ..borderRadius = 20.0
      ..text(
        padding: EdgeInsets.all(25.0),
        alignment: Alignment.center,
        text: title,
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      )..widget(
          TextField(

            controller: textEditingController,
            cursorColor: Colors.black,
            style: TextStyle(
                color: Colors.white
            ),
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(


              ),
            ),
          )

      )..widget(
          SizedBox(

            height: 0.01.sh,
          ))
      ..divider()
      ..doubleButton(
        isClickAutoDismiss: false,
        padding: EdgeInsets.only(top: 10.0),
        gravity: Gravity.center,
        withDivider: true,
        text1: acceptButton,
        color1: Colors.redAccent,
        fontSize1: 14.0,
        fontWeight1: FontWeight.bold,
        onTap1: () {
          acceptFunction;
          GetStorage().write(saveTag, textEditingController.text.toString());
        },
        text2: refuseButton,
        color2: Colors.redAccent,
        fontSize2: 14.0,
        fontWeight2: FontWeight.bold,
        onTap2: () {
          refuseFunction;

        },
      )
      ..show();
    return dialog;
  }


}


