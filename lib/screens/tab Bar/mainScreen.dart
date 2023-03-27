/*

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:start_up_project/screens/Shop/product_list_screen.dart';
import 'package:start_up_project/screens/auth/auth_main_screen.dart';
import 'package:start_up_project/screens/auth/login_screen.dart';
import 'package:start_up_project/screens/auth/special_user_signup_screen.dart';
import 'package:start_up_project/screens/home%20Page/home_page.dart';
import 'package:start_up_project/screens/profile/profil_screen.dart';

import 'package:start_up_project/screens/settings/single%20page%20settings/PreferenceSettings.dart';
import 'package:start_up_project/utils/colors.dart';

import '../../constants.dart';
import '../../widgets/IconBadge.dart';
import '../settings/setting_main_page.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List cartItems=GetStorage().read("cartItems")??[];
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>Future.value(false),
      child: Scaffold(
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: onPageChanged,

            children: <Widget>[
            HomePage(),
            SettingsMainPage(),
          SpecialUserSignUpScreen(),
          ProductListScreen(),
          ProfileScreen()
            ]),




        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width:7),
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 24.0,
                ),
                color: _page == 0
                    ? AppColors.purpleColor
                    : Theme
                    .of(context)
                    .textTheme.caption?.color,
                onPressed: ()=>_pageController.jumpToPage(0),
              ),

              IconButton(
                icon:Icon(
                  Icons.favorite,
                  size: 24.0,
                ),
                color: _page == 1
                    ? AppColors.purpleColor
                    : Theme
                    .of(context)
                    .textTheme.caption?.color,
                onPressed: ()=>_pageController.jumpToPage(1),
              ),

              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 24.0,
                  color: Colors.transparent,
                ),
                color: _page == 2
                    ? AppColors.purpleColor
                    : Theme
                    .of(context)
                    .textTheme.caption?.color,
                onPressed: ()=>_pageController.jumpToPage(2),
              ),

              IconButton(
                icon: IconBadge(
                  number:cartItems.length ,
                  icon: Icons.shopping_cart,
                  size: 24.0,
                ),
                color: _page == 3
                    ? AppColors.purpleColor
                    : Theme
                    .of(context)
                    .textTheme.caption?.color,
                onPressed: ()=>_pageController.jumpToPage(3),
              ),

              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 24.0,
                ),
                color: _page == 4
                    ? AppColors.purpleColor
                    : Theme
                    .of(context)
                    .textTheme.caption?.color,
                onPressed: ()=>_pageController.jumpToPage(4),
              ),

              SizedBox(width:7),
            ],
          ),
          color: Theme.of(context).bottomAppBarColor,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: Icon(
            Icons.search,
          ),
          onPressed: ()=>_pageController.jumpToPage(2),
        ),

      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
*/



import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:start_up_project/screens/charity/charity%20home/home_screen.dart';
import 'package:start_up_project/screens/home%20Page/home_page.dart';
import 'package:start_up_project/screens/home.dart';
import 'package:start_up_project/screens/profile/profil_screen.dart';
import 'package:start_up_project/screens/side%20menu/side_menu.dart';
import 'package:start_up_project/screens/wallet/WalletScreen.dart';

import '../../models/tabIcon_data.dart';
import '../../utils/colors.dart';
import '../../widgets/bottom_bar_view.dart';
import '../../widgets/test/custom_drawer.dart';
import '../food tracker/my_diary_screen.dart';

class BottomTabBarScreen extends StatefulWidget {


  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<BottomTabBarScreen>
    with TickerProviderStateMixin {

  List<TabIconData> _tabIconsList = TabIconData.tabIconsList;
  Widget _tabBody = Container(color: AppColors.background);
  late AnimationController _animationController;
  late ScrollController _scrollController;
  bool _isScrolled = false;

  void handleMenuButtonPressed() {
    print("clicked");
    _advancedDrawerController.showDrawer();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _tabBody = MyDiaryScreen(
      animationController: _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }




  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();

  get advancedDrawerController => _advancedDrawerController;



  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: Colors.grey.shade900,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: false,
    disabledGestures: false,
    childDecoration: BoxDecoration(
    boxShadow: [
    BoxShadow(
    color: Colors.grey.shade900,
    blurRadius: 20.0,
    spreadRadius: 5.0,
    offset: Offset(-20.0, 0.0),
    ),
    ],
    borderRadius: BorderRadius.circular(30),
    ),
    drawer: SideMenuBar(),
      child: Container(
        color: AppColors.background,
        child: Scaffold(


          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: _getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Stack(
                  children: [

                    _tabBody,
                    _bottomBar(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        BottomBarView(
          tabIconeList: _tabIconsList,
          addClick: () {},
          changeIndex: (index) {
            print(index);
            if (index == 0 ) {
              _animationController.reverse().then((value) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  _tabBody = MyDiaryScreen(
                    animationController: _animationController,
                  );
                });
              });
            } else if (index == 1 ) {
              _animationController.reverse().then((value) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  _tabBody = Dashboard();

                });
              });
            } else if (index == 2) {
              _animationController.reverse().then((value) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  _tabBody = WalletScreen();


                });
              });
            }else if (index == 3) {
              _animationController.reverse().then((value) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  _tabBody = ProfileScreen();


                });
              });
            }
          },
        ),
      ],
    );
  }
}
