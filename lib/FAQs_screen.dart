import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/utils/colors.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
leading: GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsMainPage(),));
    },
    child: Icon(Icons.chevron_left,color: AppColors.mainColor,)),
      ),
      body: Column(
        children: [
          Expanded(
            
            child: ListView(
              children: [
                // General information section
                const ExpansionTile(
                  title: Text('General information'),
                  children: [
                    ListTile(
                      title: Text('What is Walkini?'),
                      subtitle: Text('Walkini is a mobile application to help people earn when they walk'),
                    ),
                    ListTile(
                      title: Text('How does it work?'),
                      subtitle: Text('when the user walk we transform his steps into coins'),
                    ),
                  ],
                ),
                // Troubleshooting and problem-solving section
                const ExpansionTile(
                  title: Text('Troubleshooting and problem-solving'),
                  children: [
                    ListTile(
                      title: Text('I am having trouble logging in.'),
                      subtitle: Text('Try resetting your password or contacting customer support for assistance.'),
                    ),
                    ListTile(
                      title: Text('The app is crashing.'),
                      subtitle: Text('Try closing and reopening the app, or contacting customer support for assistance.'),
                    ),
                    ListTile(
                      title: Text('The app cant detect my steps.'),
                      subtitle: Text('Try closing and reopening the app,if this error persist please try to enter \n Settings->Send Reports and send the email '),
                    ),
                  ],
                ),
                // Customer support and contact information section
                Card(
                  child: Column(
                    children: const [
                      ListTile(
                        title: Text('Customer support and contact information'),
                        subtitle: Text('For assistance, you can contact us at the following numbers and email addresses:'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('+216 12 345 678'),
                      ),

                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Walkini.support.team@gmail.com'),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
