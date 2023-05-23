import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icon.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/screens/auth/additionalData/goals_selector_screen.dart';
import 'package:start_up_project/utils/colors.dart';
import 'package:start_up_project/widgets/showAwesomeSnackBar.dart';


class CountryPickerScreen extends StatefulWidget {
   CountryPickerScreen({Key? key,required this.profileModel}) : super(key: key);
NormalUserModel profileModel =NormalUserModel();
  @override
  State<CountryPickerScreen> createState() => _CountryPickerScreenState();
}
bool modifier=true;
Country? _country;
bool ready=false;

class _CountryPickerScreenState extends State<CountryPickerScreen> {

  @override
  Widget build(BuildContext context) {
    print(widget.profileModel.toJson().toString());
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
                      Text("Where are you from?.",

                        textAlign: TextAlign.center,
                        style: GoogleFonts.farro(
                            fontWeight: FontWeight.w400,
                            fontSize: 0.03.sh
                        ),),
                      SizedBox(height: 0.01.sh,),
                      SizedBox(
                          height: 0.1.sh,
                          width: 0.9.sw,
                          child: GestureDetector(
                            onTap: (){
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  setState(() {
                                    _country=country;
                                    print(country.flagEmoji);
                                  });

                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 0.25.sw,
                                  height: 0.07.sh,

                                  child: Center(child: Text(_country?.phoneCode??"+000",style: TextStyle(
                                      color: modifier?Colors.white:AppColors.mainColor,fontSize: 0.03.sh
                                  ),)),
                                  decoration: BoxDecoration(
                                      color: modifier?AppColors.mainColor:Colors.white,
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.mainColor
                                      )
                                      ,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))
                                  ),
                                ),
                                Container(
                                  width: 0.6.sw,
                                  height: 0.06.sh,

                                  child: Center(child: Text(_country?.name??"Select",style: TextStyle(
                                      color: !modifier?Colors.white:AppColors.mainColor,fontSize: 0.035.sh
                                  ),)),
                                  decoration: BoxDecoration(
                                      color: !modifier?AppColors.mainColor:Colors.white,
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.mainColor
                                      )
                                      ,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))
                                  ),
                                ),
                              ],
                            ),
                          )
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
                      if (_country!=null) {
                        if (_country!.name.isNotEmpty) {
                          ready=true;
                          widget.profileModel.nationality=_country!.name;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GoalsSelectorScreen(profileModel: widget.profileModel),));
                        }  else{
                          ready=false;
                          showAwesomeSnackBar(context, "Error", "Please select a country", Colors.cyan, Colors.cyanAccent);
                        }
                      }  else{
                        showAwesomeSnackBar(context, "Error", "Please select a country", Colors.cyan, Colors.cyanAccent);
                      }

                    },
                    child: Container(

                      width: 0.9.sw,
                      height: 0.08.sh,
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
