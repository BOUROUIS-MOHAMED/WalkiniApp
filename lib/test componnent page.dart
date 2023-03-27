/*
import 'package:flutter/material.dart';
import 'package:flutter_animate/effects/scale_effect.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class TestComponentPage extends StatefulWidget {
  const TestComponentPage({Key? key}) : super(key: key);

  @override
  State<TestComponentPage> createState() => _TestComponentPageState();
}

class _TestComponentPageState extends State<TestComponentPage> {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(40, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'progressBarOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-50, 0),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.7,
          end: 1,
        ),
      ],
    ),
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          // Generated code for this Column Widget...
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.supervisor_account_rounded,
                  color: Color(0xFF101213),
                  size: 44,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 4),
                  child: Text(
                    "65.4",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(

                      color: Color(0xFF101213),
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(

                    'Customers'
 Customers
,

                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(

                  color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )

          ,
          // Generated code for this dashboardMainCard Widget...
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x23000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sales",
                            style: GoogleFonts.outfit(
                              color: Color(0xFF101213),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                             "Total Sales Today",
                              style: GoogleFonts.outfit(
                                color: Color(0xFF57636C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              "500.20 TND",
                              style: GoogleFonts.outfit(
                                color: Color(0xFF101213),
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
                    ),
                    CircularPercentIndicator(
                      percent: 0.55,
                      radius: 45,
                      lineWidth: 4,
                      animation: true,
                      progressColor: Color(0xFF4B39EF),
                      backgroundColor: Color(0xFFF1F4F8),
                      center: Text(
                        "55%"
                        ,
                        style: GoogleFonts.outfit(
                          color: Color(0xFF101213),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['progressBarOnPageLoadAnimation']!),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.trending_up_sharp,
                          color: Color(0xFF39D2C0),
                          size: 24,
                        ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
                      ],
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
          )


        ],
      ),
    );
  }
}
*/
