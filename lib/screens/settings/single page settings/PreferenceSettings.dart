
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:start_up_project/screens/settings/single%20page%20settings/settings_picker.dart';

import '../settings_navigation/navigation.dart';

class PreferencesSettings extends StatefulWidget {
  const PreferencesSettings({
    Key? key,
  }) : super(key: key);

  @override
  State<PreferencesSettings> createState() =>
      _PreferencesSettingsState();
}

class _PreferencesSettingsState
    extends State<PreferencesSettings> {
  bool useCustomTheme = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
appBar: AppBar(
  leading: Icon(CupertinoIcons.chevron_left),
),
        body: SettingsList(
          platform: DevicePlatform.iOS,
          sections: [
            SettingsSection(
              title: Text('Common'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  value: Text('English'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.cloud_outlined),
                  title: Text('Environment'),
                  value: Text('Production'),
                ),
                 SettingsTile.navigation(
                  leading: Icon(Icons.devices_other),
                  title: Text('Platform'),

                ),
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      useCustomTheme = value;
                    });
                  },
                  initialValue: useCustomTheme,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable custom theme'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('Account'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.phone),
                  title: Text('Phone number'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.mail),
                  title: Text('Email'),
                  enabled: false,
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.logout),
                  title: Text('Sign out'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('Security'),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: true,
                  leading: Icon(Icons.phonelink_lock),
                  title: Text('Lock app in background'),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: true,
                  leading: Icon(Icons.fingerprint),
                  title: Text('Use fingerprint'),
                  description: Text(
                    'Allow application to access stored fingerprint IDs',
                  ),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: true,
                  leading: Icon(Icons.lock),
                  title: Text('Change password'),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: true,
                  leading: Icon(Icons.notifications_active),
                  title: Text('Enable notifications'),
                ),
              ],
            ),
            SettingsSection(
              title: Text('Misc'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.description),
                  title: Text('Terms of Service'),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.collections_bookmark),
                  title: Text('Open source license'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


