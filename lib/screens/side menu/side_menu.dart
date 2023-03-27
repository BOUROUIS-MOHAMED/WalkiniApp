import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';

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
              Container(
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
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text("John Doe",
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
                      onTap: () {},
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
                          onTap: () {},
                          textColor: Colors.white,
                          iconColor: Colors.white,

                          leading: Icon(Iconsax.shopping_bag),
                          title: Text('Shop'),
                        ),
                        ListTile(
                          onTap: () {},
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
                        onTap: () {},
                        textColor: Colors.white,
                        iconColor: Colors.white,

                        leading: Icon(Iconsax.wallet),
                        title: Text('Wallet'),

                      ),
                      children: [
                        ListTile(
                          onTap: () {},
                          textColor: Colors.white,
                          iconColor: Colors.white,

                          leading: Icon(Iconsax.money),
                          title: Text('Amount'),
                        ),
                        ListTile(
                          onTap: () {},
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          leading: Icon(Iconsax.shopping_cart),
                          title: Text('Transaction'),
                        ),
                      ],
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(LineIcons.donate),
                      title: Text('Donate'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.strongbox),
                      title: Text('Lucky box'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.status_up),
                      title: Text('My Diary'),
                    ),
                    SizedBox(height: 0.03.sh,),
                    Divider(color: Colors.grey.shade800),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Iconsax.setting),
                      title: Text('Settings'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.support),
                      title: Text('Support'),
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
