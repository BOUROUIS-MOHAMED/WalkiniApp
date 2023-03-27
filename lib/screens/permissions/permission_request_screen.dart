/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/colors.dart';

class PermissionRequestScreen extends StatefulWidget {
  const PermissionRequestScreen({Key? key}) : super(key: key);

  @override
  State<PermissionRequestScreen> createState() => _PermissionRequestScreenState();
}

class _PermissionRequestScreenState extends State<PermissionRequestScreen> {
  permissionRequester(int index, String parameter) async {

    (GetStorage().read(parameter)) == null
        ? await GetStorage().write(parameter, true)
        : await GetStorage().write(parameter, !GetStorage().read(parameter));

    setState(() {});
  }
  bool activity_recognition=false;
  bool location_permission=false;
 Future<void> getPermissionStatus() async {

   activity_recognition=await Permission.activityRecognition.status.isGranted;
   location_permission=await Permission.location.isGranted;
   print(location_permission);
   print(activity_recognition);


 }
  @override
  Widget build(BuildContext context) {
   getPermissionStatus();

    return  Scaffold(

appBar: AppBar(
  leading: GestureDetector(
      onTap: () {

        setState(() {});
      },
      child: Icon(
        CupertinoIcons.chevron_back,
        color: Colors.black38,
      )),
  elevation: 0,
  backgroundColor: Colors.transparent,
),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child:   Stack(

      children: [
      new LinearProgressBar(
      maxSteps: 3,
        progressType: LinearProgressBar.progressTypeLinear,
        // Use Linear progress
        currentStep: 1,
        progressColor: AppColors.appGreen,
        backgroundColor: Colors.grey,
      ),
      Positioned(
        top: 0.02.sh,
        left: 0,
        right: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                  "You need to accept this list of permission,we need all this permission to offer you the user experience you deserve:"
                  , style: GoogleFonts.gabriela(
                  fontSize: 0.028.sh
              )),
              SizedBox(
                height: 0.02.sh,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () async {
                        if (await Permission.location.request().isGranted) {

                        }
                        setState(() {

                        });
                      },
                      child: RequestPermissionTile(
                          permissionName: 'Location Permission',
                          indexer: 1,
                          index: 0,
                          parametre:
                          'Location ',
                          val: location_permission,
                          bottomSpace: 5)),
                  GestureDetector(
                      onTap: () async {
                        if (await Permission.activityRecognition.request().isGranted) {
                          setState(() {

                          });
                        }
                        setState(() {

                        });
                      },
                      child: RequestPermissionTile(
                          permissionName: 'Activity Recognition',
                          indexer: 2,
                          index: 0,
                          parametre:
                          'Activity Recognition',
                          val: activity_recognition,
                          bottomSpace: 5)),
                ],
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        permissionRequester(
                            3, 'NotificationParametre');
                        setState(() {});
                      },
                      child: RequestPermissionTile(
                          permissionName: 'UserExperienceParametre',
                          indexer: 3,
                          index: 0,
                          parametre:
                          'NotificationParametre',
                          val: activity_recognition,
                          bottomSpace: 5)),
                  GestureDetector(
                      onTap: () {
                        permissionRequester(
                            4, 'AutoUpdateParametre');
                        setState(() {});
                      },
                      child: RequestPermissionTile(
                          permissionName: 'UserExperienceParametre',
                          indexer: 4,
                          index: 0,
                          parametre:
                          'AutoUpdateParametre',
                          val: activity_recognition,
                          bottomSpace: 5)),
                ],
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        permissionRequester(
                            5, 'UserExperienceParametre');
                        setState(() {});
                      },
                      child: RequestPermissionTile(
                          permissionName: 'UserExperienceParametre',
                          indexer: 5,
                          index: 0,
                          parametre:
                          'UserExperienceParametre',
                          val: activity_recognition,
                          bottomSpace: 5)),
                  GestureDetector(
                      onTap: () {
                        permissionRequester(
                            5, 'UserExperienceParametre');
                        setState(() {});
                      },
                      child: RequestPermissionTile(
                          permissionName: 'UserExperienceParametre',

                          indexer: 5,
                          index: 0,
                          parametre:
                          'UserExperienceParametre',
                          val: activity_recognition,
                          bottomSpace: 5)),
                ],
              )

            ]
        ),
      ),
      ],
    )
      ),
    );
  }
}

class RequestPermissionTile extends StatelessWidget {
  RequestPermissionTile({
    Key? key,
    this.par,
    required this.permissionName,
    required this.val,
    required this.index,
    required this.indexer,
    required this.parametre,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);
  final Function()? par;
  final int indexer;
  final String permissionName;
  final bool val;
  final String parametre;
  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {

List icons=[
  CupertinoIcons.location,
  Icons.directions_run_outlined,
  CupertinoIcons.location,
  CupertinoIcons.location,
  CupertinoIcons.location,

];


    final child = Container(
      child: Container(

        decoration: BoxDecoration(
          color: GetStorage().read(parametre) == true
              ? AppColors.mainColor
              : AppColors.appWhite,
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.only(
            left: 0.04.sw, right: 0.04.sw, bottom: 0.01.sh, top: 0.02.sh),
        margin: EdgeInsets.symmetric(horizontal: 0.01.sw),
        height: extent,
        width: 0.45.sw,

        child: Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FaIcon(
                    icons[indexer-1],
                    color: GetStorage().read(parametre) == true
                        ? AppColors.appWhite
                        : AppColors.appBlack,
                  ),
                  Text(
                    permissionName,
                    style: GoogleFonts.abel(
                      fontSize: 0.018.sh,
                      color: GetStorage().read(parametre) == true
                          ? AppColors.appWhite
                          : AppColors.appBlack,
                    ),
                  ),
                ],
              ),
              AbsorbPointer(
                child: Icon(!val?Icons.close:Icons.check,color:val?Colors.green:Colors.redAccent,),
              )
            ],
          ),
        ),
      ),
    );



    return child;
  }
}
*/
