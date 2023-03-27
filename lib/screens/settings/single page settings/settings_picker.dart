import 'package:get_storage/get_storage.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
class SettingsPickerScreen extends StatefulWidget {
   SettingsPickerScreen({
    Key? key,
    required this.items,
    required this.pickMessage,
     required this.pickTitle,
     required this.lastPage,
    this.multiSelection=false,
  }) : super(key: key);
   late String pickMessage;
   late List items;
   late String pickTitle;
   late bool multiSelection;
   late Widget lastPage;
  @override
  State<SettingsPickerScreen> createState() => _SettingsPickerScreenState();
}

class _SettingsPickerScreenState extends State<SettingsPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pickTitle)),
      body: SettingsList(
       // platform: platform,
        sections: [
          SettingsSection(
            title: Text(widget.pickMessage),
            tiles: List.generate(widget.items.length, (index) {
              return SettingsTile(
                title: Text(widget.items[index]),
                onPressed: (_)  async {
                 await GetStorage().write(widget.pickTitle, widget.items[index]);
                 Navigator.of(context).push(
                     PageTransition(
                         type: PageTransitionType.bottomToTopJoined,
                         childCurrent: this.widget,
                         child: widget.lastPage));

                },
              );
            })
          ),
        ],
      ),
    );
  }
}