
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';
import 'package:start_up_project/error%20handler/SomethingWentWrong.dart';

import '../../../models/charity/urgent.dart';
import '../../../models/normal_user_model.dart';
import '../../../utils/colors.dart';
import '../../../widgets/charity/category.dart';
import '../../../widgets/charity/charity_box_widget.dart';


final List<Urgent> urgents = [
  Urgent(
    title: 'Help our buddy get better education',
    target: '99.4646',
    percent: '80',
    assetName: 'assets/images/image_placeholder.svg',
    categories: ['Children', 'Education'],
    days: 40,
    organizer: 'White Hat Organization',
    remaining: '21.6969',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  ),
  Urgent(
    title: 'Help Malika to school again with her friends',
    target: '99.4646',
    percent: '80',
    assetName: 'assets/images/image_placeholder.svg',
    categories: ['Children', 'Education'],
    days: 40,
    organizer: 'White Hat Organization',
    remaining: '21.6969',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  ),
  Urgent(
    title: 'Help our buddy get better education',
    target: '99.4646',
    percent: '80',
    assetName: 'assets/images/image_placeholder.svg',
    categories: ['Children', 'Education'],
    days: 40,
    organizer: 'White Hat Organization',
    remaining: '21.6969',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  ),
  Urgent(
    title: 'Help our buddy get better education',
    target: '99.4646',
    percent: '80',
    assetName: 'assets/images/image_placeholder.svg',
    categories: ['Children', 'Education'],
    days: 40,
    organizer: 'White Hat Organization',
    remaining: '21.6969',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  ),
];

class CharityHomeScreen extends StatefulWidget {
  const CharityHomeScreen();

  @override
  _CharityHomeScreenState createState() => _CharityHomeScreenState();
}



class _CharityHomeScreenState extends State<CharityHomeScreen> {


  NormalUserModel profile= GetStorage().read("profile");
  late final ScrollController controller;
  int currentIndex = 0;
  final double oneCardWidth = 256.w;
  double position = 0;
  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      position = controller.offset;
      if ((position / oneCardWidth).floor() < 0) {
        return;
      }
      if (controller.offset == 0) {
        setState(() {
          currentIndex = 0;
        });
        return;
      }
      setState(() {
        currentIndex = (position / oneCardWidth).floor() + 1;
      });
    });

    super.initState();
  }

  initData() async{
    profile= GetStorage().read("profile");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:initData() ,
        
        builder: (context, snapshot) {
          if (snapshot.connectionState==ConnectionState.done) {
            
            if (snapshot.hasError) {
              return SomethingWentWrong();
            }  else{
              return SingleChildScrollView(
                child: Container(
                  height: 1.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        32.r,
                      ),
                      bottomRight: Radius.circular(
                        32.r,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Spacer(),
                      CharityHeader(profileModel: profile,),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(
                              12.r,
                            ),
                          ),
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/images/mask_diamond.svg',
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Change the world with',
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.headline6!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'your little help',
                                      textAlign: TextAlign.center,
                                      style:
                                      Theme.of(context).textTheme.headline6!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                          Size(
                                            0,
                                            0,
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text('Donate'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Category(),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Urgently Needed',
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),

                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                          padding: EdgeInsets.only(
                            left: 16.0.w,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                width: 1.sw,
                                height: 0.4.sh,
                                child:
                                ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,

                                    itemBuilder: (context, index) =>
                                        Padding(
                                          padding:  EdgeInsets.only(right: 0.05.sh),
                                          child: Container(
                                            height: 0.2.sh,
                                            width: 0.9.sw,

                                            child: CharityBoxWidget(

                                            ),
                                          ),
                                        )

                                  /*CharityBoxWidget*/
                                )

                            ),
                          )),
                      Spacer(),
                      // Generated code for this Card_Task_3 Widget...
                      Container(
                        width: 1.sw,
                        height: 0.28.sh,
                        child: ListView.builder(
                          itemBuilder: (context, index) =>  Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            'https://picsum.photos/seed/124/600',
                                            width: 0.35.sw,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Site Name" ,

                                                  style:
                                                  GoogleFonts.outfit(
                                                    color: Color(0xFF101213),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                        "Trap",

                                                        style:
                                                        GoogleFonts.outfit(
                                                          color: Color(0xFF4B39EF),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                      child: Text(
                                        ' Notes & descriptions go here t...',

                                        style: GoogleFonts.outfit(
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                            child: SelectionArea(
                                                child: Text(
                                                  "Last Activity ",
                                                  style: GoogleFonts.outfit(
                                                    color: Color(0xFF57636C),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(4, 8, 0, 0),
                                              child: SelectionArea(
                                                  child: Text(
                                                    "Yesterday, 4:21pm ",
                                                    style: GoogleFonts.outfit(
                                                      color: Color(0xFF101213),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              child:Text('More details',style:GoogleFonts.outfit(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),)
                                          ),




                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              );
            }

          }  else{
            return SkeletonListView() ;
          }

        }
      ),
    );
  }
}

class CharityHeader extends StatelessWidget {
   CharityHeader({
    required this.profileModel,

    super.key,
  });
  NormalUserModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.0.w,
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
              ),
              Text(
                profileModel.firstName??"",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.kTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
                color: AppColors.kPlaceholder2,
              ),
              child: Center(
                child: Icon(Icons.notifications_active_outlined),
              ),
            ),
            Positioned(
              right: -2.w,
              top: -2.w,
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ],
    ),
            );
  }
}
