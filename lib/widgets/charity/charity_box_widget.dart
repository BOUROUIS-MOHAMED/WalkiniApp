import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CharityBoxWidget extends StatelessWidget {
  const CharityBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 0.2.sh,
          width: 0.9.sw,
          child: Stack(
            alignment: AlignmentDirectional(0, 1),
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1567850083672-65ae6c8a696b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fGNhbm5hYmlzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                    width:0.9.sw,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            CupertinoIcons.heart,
                            color: Color(0xFF39D2C0),
                            size: 24,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Text(
                              "Charity Name",
                              style: GoogleFonts.outfit(
                                color: Color(0xFF39D2C0),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFC5C3CE),
                                Color(0xFFD2A239),
                                Color(0xFFFF5963)
                              ],
                              stops: [0, 0.3, 1],
                              begin: AlignmentDirectional(1, 0.98),
                              end: AlignmentDirectional(-1, -0.98),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF101213),
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
          child: Text(
            "title",
            style: GoogleFonts.outfit(
              color: Color(0xFF101213),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
          child: Text(
            "kjlj jkhj hjkh jhkh jh kjh jh hj khj h hk hjh jh  hj hjh hj jh hj",
            style: GoogleFonts.outfit(
              color: Color(0xFF57636C),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
               children: [
                 Card(
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   color: Color(0xFF4B39EF),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40),
                   ),
                   child: Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(40),
                       child: Image.network(
                         'https://images.unsplash.com/photo-1620577438168-b2079ab90f86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBvY3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                         width: 20,
                         height: 20,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 ),
                 Card(
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   color: Color(0xFF39D2C0),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40),
                   ),
                   child: Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(40),
                       child: Image.network(
                         'https://images.unsplash.com/photo-1620577438168-b2079ab90f86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBvY3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                         width: 20,
                         height: 20,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 ),
                 Card(
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                   color: Color(0xFFFF5963),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(40),
                   ),
                   child: Padding(
                     padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(40),
                       child: Image.network(
                         'https://images.unsplash.com/photo-1620577438168-b2079ab90f86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBvY3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                         width: 20,
                         height: 20,
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 ),
                 Text(
                   "16 one donated",
                   style: GoogleFonts.outfit(
                     color: Color(0xFFFF5963),
                     fontSize: 12,
                     fontWeight: FontWeight.normal,
                   ),
                 ),
               ],
             ),
              Text(
                "View related topics *",
                textAlign: TextAlign.end,
                style: GoogleFonts.outfit(
                  color: Color(0xFF4B39EF),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
