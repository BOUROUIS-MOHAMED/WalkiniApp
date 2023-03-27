
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/settings_picker.dart';

class AppearanceSettings extends StatefulWidget {
  const AppearanceSettings({
    Key? key,
  }) : super(key: key);

  @override
  State<AppearanceSettings> createState() =>
      _AppearanceSettingsState();
}

class _AppearanceSettingsState
    extends State<AppearanceSettings> {
  bool focusMode=false;

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
              title: const Text('General'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Theme'),

                  onPressed: (context) async {
                    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPickerScreen(
                      lastPage: AppearanceSettings(),
                        items: Constants.themeModes,
                        pickMessage: "Select the application theme mode", pickTitle: "Theme Mode")));
                  },
                  value: Text(GetStorage().read("Theme Mode")??"Unknown"),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.cloud_outlined),
                  title: Text('Zoom Level'),

                  onPressed: (context) async {
                    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPickerScreen(
                        lastPage: AppearanceSettings(),
                        items: ["Small :80%","Normal :100%","Big :120%"],
                        pickMessage: "Select the application items size : \nUser normal one to avoid bugs", pickTitle: "Application Zoom Level")));
                  },
                  value: Text(GetStorage().read("Application Zoom Level")??"Unknown"),
                ),

                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      focusMode = value;
                    });
                  },
                  initialValue: focusMode,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable Focus Mode'),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


