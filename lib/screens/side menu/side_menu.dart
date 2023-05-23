import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';
import 'package:start_up_project/FAQs_screen.dart';
import 'package:start_up_project/screens/Shop/cart_screen.dart';
import 'package:start_up_project/screens/Shop/product_list_screen.dart';
import 'package:start_up_project/screens/box_screen.dart';
import 'package:start_up_project/screens/charity/charity%20home/charity_home_screen.dart';
import 'package:start_up_project/screens/home.dart';
import 'package:start_up_project/screens/profile/profil_screen.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/screens/tab%20Bar/mainScreen.dart';
import 'package:start_up_project/screens/tasks/demo.dart';
import 'package:start_up_project/screens/wallet/WalletScreen.dart';
import 'package:start_up_project/widgets/showAwesomeSnackBar.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        padding: EdgeInsets.only(top: 20),
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(),));
                },
                child: Container(
                    width: 0.1.sh,
                    height: 0.1.sh,
                    margin: EdgeInsets.only(
                      left: 20,
                      top: 10.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/avatars/avatar-1.png')
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text("HAMA",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
              ),
              Spacer(),
              Divider(color: Colors.grey.shade800,),
              Container(
              height: 0.7.sh,
              width: 1.sw,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BottomTabBarScreen() ,));
                      },
                      leading: Icon(Iconsax.home_24),
                      title: Text('Home'),
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.all(0),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      trailing: Icon(Iconsax.arrow_bottom,color: Colors.white,),
                      childrenPadding: EdgeInsets.only(left: 20),
                      title: ListTile(
                        onTap: () {},
                        textColor: Colors.white,
                        iconColor: Colors.white,

                        leading: Icon(Iconsax.shop),
                        title: Text('FiMarket'),

                      ),
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ProductListScreen()),));
                          },
                          textColor: Colors.white,
                          iconColor: Colors.white,

                          leading: Icon(Iconsax.shopping_bag),
                          title: Text('Shop'),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(),));
                          },
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          leading: Icon(Iconsax.shopping_cart),
                          title: Text('Cart'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.all(0),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      trailing: Icon(Iconsax.arrow_bottom,color: Colors.white,),
                      childrenPadding: EdgeInsets.only(left: 20),
                      title: ListTile(
                        onTap: () {

                        },
                        textColor: Colors.white,
                        iconColor: Colors.white,

                        leading: Icon(Iconsax.wallet),
                        title: Text('Wallet'),

                      ),
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => WalletScreen(),));
                          },
                          textColor: Colors.white,
                          iconColor: Colors.white,

                          leading: Icon(Iconsax.money),
                          title: Text('Amount'),
                        ),
                        ListTile(
                          onTap: () {
                            showNormalSnackBar(context, "this feature will coming soon", CupertinoColors.systemPink, Colors.black);
                          },
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          leading: Icon(Iconsax.timer),
                          title: Text('History'),
                        ),
                      ],
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CharityHomeScreen(),));
                      },
                      leading: Icon(LineIcons.donate),
                      title: Text('Donate'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BoxMainScreen(),));
                      },
                      leading: Icon(Iconsax.strongbox),
                      title: Text('Lucky box'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard(),));
                      },
                      leading: Icon(Iconsax.status_up),
                      title: Text('My Diary'),
                    ),
                    SizedBox(height: 0.03.sh,),
                    Divider(color: Colors.grey.shade800),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsMainPage(),));
                      },
                      leading: Icon(Iconsax.setting),
                      title: Text('Settings'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AchievementScreen(),));
                      },
                      leading: Icon(Icons.support),
                      title: Text('Achievement'),
                    ),
                  ],
                ),
              ),
            ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Version 1.0.0', style: TextStyle(color: Colors.grey.shade500),),
                    Text('ID: EHYY-38BH-14CD-FGBC', style: TextStyle(color: Colors.grey.shade500),),

                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
