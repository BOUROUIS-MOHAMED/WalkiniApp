import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/screens/profile/skeleton_loading_cards.dart';
import 'package:start_up_project/widgets/subscription_bottom_sheet.dart';

import '../../error handler/SomethingWentWrong.dart';

import '../../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

late NormalUserModel profileModel;
class _ProfileScreenState extends State<ProfileScreen> {
  initData() async {
    profileModel =NormalUserModel.fromJson( await GetStorage().read("profile"));
    print(profileModel);
  }

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().toIso8601String());
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(0.02.sw),
        child: Scaffold(
          body: FutureBuilder(
              future: initData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print("error"+snapshot.error.toString());
                    return SomethingWentWrong();
                  } else {
                    return SingleChildScrollView(
                      child: Container(
                        height: 1.sh+Constants.bottomTabBarHeight,
                        width: 1.sw,
                        child: Column(
                          children: [
                            //AppBar
                            Container(
                              padding: EdgeInsets.all(0.04.sw),
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          CupertinoIcons.chevron_left,
                                          color: AppColors.appWhite,
                                        )),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.transparent,
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.ellipsis,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Space
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 0.2.sw,
                                        child:CachedNetworkImage(
                                          imageUrl: profileModel.image!,
                                          imageBuilder: (context, imageProvider) =>
                                              CircleAvatar(
                                                backgroundColor: Colors.green,
                                                radius: 0.15.sw,
                                                backgroundImage: imageProvider),


                                          placeholder: (context, url) => CircleAvatar(
                backgroundColor: Colors.red,
                radius: 0.15.sw,

                ),
                                          errorWidget: (context, url, error) => CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 0.15.sw,
                                            child:
                                          Icon(Icons.error)),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 0.06.sw,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.02.sh,
                                  ),
                                  Text(
                                    "${profileModel.firstName} ${profileModel.lastName!}",
                                    style: GoogleFonts.jaldi(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 0.025.sh),
                                  ),
                                  SizedBox(
                                    width: 0.01.sw,
                                  ),
                                  Container(
                                    width: 0.4.sw,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.r)),
                                    child: OutlinedButton(
                                        onPressed: () {
                                          subscriptionBottomSheet(context);
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r)))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Premium"),
                                            SizedBox(
                                              width: 0.01.sw,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.crown,
                                              color: AppColors.yellowColor,
                                            )
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    height: 0.01.sh,
                                  ),
                                  Container(
                                      width: 0.5.sw,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "upgrade your membership!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          Icon(
                                            CupertinoIcons.chevron_right,
                                            size: 0.01.sh,
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.05.sh,
                            ),

                            Container(
                              width: 1.sw,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        profileModel.totalSteps.toString()??"0",
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                      Text(
                                        "Total Steps",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),

                                  //

                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            vertical: BorderSide(
                                                style: BorderStyle.solid,
                                                width: 1))),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.1.sw),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          profileModel.score.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Text(
                                          "Score",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        profileModel.nationality.toString(),
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                      Text(
                                        "nationality",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 0.9.sw,
                              height: 0.1.sh,
                              padding: EdgeInsets.all(0.002.sw),
                              decoration: BoxDecoration(
                                  color: AppColors.iconColor1,
                                  borderRadius: BorderRadius.circular(30.r)),
                              child: ListTile(
                                leading: Container(
                                  width: 0.05.sh,
                                  height: 0.05.sh,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black),
                                  child: Icon(
                                    FontAwesomeIcons.trophy,
                                    color: Colors.white,
                                    size: 0.02.sh,
                                  ),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Achievements!',
                                        style:
                                            Theme.of(context).textTheme.subtitle1,
                                        overflow: TextOverflow.ellipsis),
                                    Container(
                                        width: 0.2.sw,
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 0.015.sh,
                                              child: Icon(
                                                FontAwesomeIcons.solidHeart,
                                                color: Colors.redAccent,
                                                size: 0.015.sh,
                                              ),
                                            ),
                                            Positioned(
                                              left: 20,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 0.015.sh,
                                                child: Icon(
                                                  FontAwesomeIcons.award,
                                                  color: Colors.blueAccent,
                                                  size: 0.015.sh,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 40,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 0.015.sh,
                                                child: Icon(
                                                  FontAwesomeIcons
                                                      .handHoldingHeart,
                                                  color: Colors
                                                      .orangeAccent.shade100,
                                                  size: 0.015.sh,
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 0.9.sw,
                              height: 0.1.sh,
                              padding: EdgeInsets.all(0.002.sw),
                              decoration: BoxDecoration(
                                  color: AppColors.darkGreen,
                                  borderRadius: BorderRadius.circular(30.r)),
                              child: ListTile(
                                  leading: Container(
                                    width: 0.05.sh,
                                    height: 0.05.sh,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black),
                                    child: Icon(
                                      FontAwesomeIcons.shoePrints,
                                      color: Colors.white,
                                      size: 0.02.sh,
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        'Challenges!   ',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.fire,
                                        color: Colors.orange,
                                        size: 0.025.sh,
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 0.02.sh,
                                      ))),
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 0.9.sw,
                              height: 0.1.sh,
                              padding: EdgeInsets.all(0.002.sw),
                              decoration: BoxDecoration(
                                  color: AppColors.purpleColor,
                                  borderRadius: BorderRadius.circular(30.r)),
                              child: ListTile(
                                  leading: Container(
                                    width: 0.05.sh,
                                    height: 0.05.sh,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black),
                                    child: Icon(
                                      Icons.wallet_sharp,
                                      color: Colors.white,
                                      size: 0.02.sh,
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        'Wallet!   ',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.coins,
                                        color: Colors.white,
                                        size: 0.025.sh,
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 0.02.sh,
                                      ))),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: SkeletonLoadingCards(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
