import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icon.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:start_up_project/models/profile_model.dart';
import 'package:start_up_project/screens/auth/additionalData/country_picker_screen.dart';
import 'package:start_up_project/utils/colors.dart';


class BirthdayPickerScreen extends StatefulWidget {
   BirthdayPickerScreen({Key? key,required this.profileModel}) : super(key: key);
ProfileModel profileModel;
  @override
  State<BirthdayPickerScreen> createState() => _BirthdayPickerScreenState();
}

bool ready=false;

DateTime _selectedDate = DateTime.now();



class _BirthdayPickerScreenState extends State<BirthdayPickerScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 1.sw,
            height: 1.sh,
            child:Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Text("When’s your \n birthday.",

                        textAlign: TextAlign.center,
                        style: GoogleFonts.farro(
                            fontWeight: FontWeight.w400,
                            fontSize: 0.03.sh
                        ),),
                      SizedBox(height: 0.1.sh,),
                      SizedBox(
                        height: 0.4.sh,
                        width: 0.9.sw,
                        child: CupertinoDatePicker(onDateTimeChanged: (DateTime value) { setState(() {
                          _selectedDate=value;
                          print(_selectedDate);
                        }); },
                          mode: CupertinoDatePickerMode.date,

                          use24hFormat: true,
                          maximumYear: DateTime.now().year,

                        ),
                      ),
                    ],
                  ),),
                Expanded(
                  flex: 1,
                  child: Container(


                  )
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: (){
                      widget.profileModel.birthday=_selectedDate;
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CountryPickerScreen(profileModel: widget.profileModel),));
                    },
                    child: Container(

                      width: 0.9.sw,
                      height: 0.07.sh,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(child: Text("Next",style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.03.sh
                      ),)),
                    ),
                  ),
                )

              ],
            )

        ),
      ),

    );
  }


}
