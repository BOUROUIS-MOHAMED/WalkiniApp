import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:start_up_project/screens/permissions/permission%20widgets/activity_tracker_permission_widget.dart';

import '../../../utils/colors.dart';

class LocationPermissionWidget extends StatefulWidget {
  const LocationPermissionWidget({
    super.key,
  });


  @override
  State<LocationPermissionWidget> createState() => _LocationPermissionWidgetState();
}

class _LocationPermissionWidgetState extends State<LocationPermissionWidget> {

  bool locationPermissionStatus=false;
 String message="Denied";
  init() async {
    locationPermissionStatus=await getLocationPermission().status.isGranted;

   message= locationPermissionStatus?"Approved":"Denied";
  }
  @override
  void initState() {
   init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        return SafeArea(

          child: Scaffold(

            backgroundColor: AppColors.appWhite,
            body: Container(
              height: 1.sh,
              width: 1.sw,
              child: Stack(

                children: [
                  LinearProgressBar(
                    maxSteps: 6,
                    progressType: LinearProgressBar.progressTypeLinear,
                    // Use Linear progress
                    currentStep: 4,
                    progressColor: AppColors.appGreen,
                    minHeight: 0.01.sh,
                    backgroundColor: Colors.grey,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 0.2.sh,
                        child: Container(
                          height: 0.5.sh,
                          width: 1.sw,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.deepOrangeAccent,
                                size: 0.12.sh,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'We need \nLocation Permission',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.outfit(
                                        color: Color(0xFF090F13),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'We need this permission to track your location!\n '
                                            '\n'
                                            'Location Permission $message'
                                        ,
                                        textAlign: TextAlign.center,
                                        style:
                                        GoogleFonts.outfit(
                                          color: Color(0xFF7C8791),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.05.sh,
                        left: 20,
                        right: 20,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                          child: Container(
                            width: 0.4.sw,
                            height: 0.07.sh,
                            child: OutlinedButton(
                              child: Text("Continue",style:  GoogleFonts.lexendDeca(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),),
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                                backgroundColor:MaterialStatePropertyAll(locationPermissionStatus?AppColors.mainColor:Colors.redAccent),



                              ),
                              onPressed: () async {
permissionHandler();
                                String msg=locationPermissionStatus==false ?
                                "do you want to continue without it":"";


                                showAlertDialog(context,msg);

                              },



                            ),
                          ),
                        ),
                      ),


                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );


  }

  Permission getLocationPermission() {
    if(Platform.isAndroid /** Also check if SDK >= 29 **/){
      return Permission.location;
    } else if(Platform.isIOS) {
      return Permission.location;
    }
    return Permission.location;
  }

  Future<void> permissionHandler() async {
    var status = await getLocationPermission().status;
    await getLocationPermission().shouldShowRequestRationale;
    if (status.isGranted) {
      setState(() {
        locationPermissionStatus=true;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityTrackerPermissionWidget(),));
      });
    }else {
      setState(() async {
        locationPermissionStatus = false;
        openAppSettings();
      });
    }
  }

  showAlertDialog(BuildContext context,String msg) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Skip",style: GoogleFonts.outfit(
          fontSize: 0.013.sh
      ),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = Container(

      child: Container(
        width: 0.6.sw,

        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ))
          ),
          child: Text("Continue"),
          onPressed:  () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("Warning"),
      content: Text(msg),

      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}