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
import 'package:start_up_project/models/profile_additional_information_model.dart';
import 'package:start_up_project/models/profile_model.dart';
import 'package:start_up_project/screens/auth/additionalData/physical_problem_picker_screen.dart';
import 'package:start_up_project/utils/colors.dart';


class WeightPickerScreen extends StatefulWidget {
  WeightPickerScreen({Key? key,required this.profileModel,required this.profileAdditionalInformationModel}) : super(key: key);
  ProfileModel profileModel=ProfileModel();
  ProfileAdditionalInformationModel profileAdditionalInformationModel = ProfileAdditionalInformationModel();

  @override
  State<WeightPickerScreen> createState() => _WeightPickerScreenState();
}
bool isKiloGram=true;
TextEditingController weightTextFieldController=TextEditingController();
String weight="70.0";
List units=[
  "kg","LBS"
];
bool valid=false;
String unit=units[0];


DateTime _selectedDate = DateTime.now();



class _WeightPickerScreenState extends State<WeightPickerScreen> {

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
                      Text("Your weight?.",

                        textAlign: TextAlign.center,
                        style: GoogleFonts.farro(
                            fontWeight: FontWeight.w400,
                            fontSize: 0.03.sh
                        ),),
                      SizedBox(height: 0.01.sh,),
                      SizedBox(
                          height: 0.1.sh,
                          width: 0.9.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isKiloGram=false;
                                    unit=units[1];
                                  });
                                },
                                child: Container(
                                  width: 0.2.sw,
                                  height: 0.05.sh,

                                  child: Center(child: Text("LBS",style: TextStyle(
                                      color: isKiloGram?Colors.white:AppColors.mainColor
                                  ),)),
                                  decoration: BoxDecoration(
                                      color: isKiloGram?AppColors.mainColor:Colors.white,
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.mainColor
                                      )
                                      ,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isKiloGram=true;
                                    unit=units[0];
                                  });
                                },
                                child: Container(
                                  width: 0.2.sw,
                                  height: 0.05.sh,

                                  child: Center(child: Text("KG",style: TextStyle(
                                      color: !isKiloGram?Colors.white:AppColors.mainColor
                                  ),)),
                                  decoration: BoxDecoration(
                                      color: !isKiloGram?AppColors.mainColor:Colors.white,
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.mainColor
                                      )
                                      ,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                      SizedBox(height: 0.05.sh,),
                      SizedBox(
                        child:  Center(
                          child: Container(
                            height: 0.1.sh,
                            width: 0.9.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 0.2.sh,
                                    width: 0.3.sw,
                                    decoration: BoxDecoration(

                                    ),
                                    child: TextFormField(
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                                        TextInputFormatter.withFunction(
                                              (oldValue, newValue) => newValue.copyWith(
                                            text: newValue.text.replaceAll('.', ','),
                                          ),
                                        ),
                                      ],
                                      maxLength: 3,
                                      controller: weightTextFieldController,
                                      onChanged: (value) {
                                        {
                                          if(value.isNotEmpty){
                                            double w=double.parse(value) ;
                                            if (w <45.0){
                                              valid=false;
                                            }else{
                                              valid=true;
                                              weight=w.toString()+unit;
                                            }


                                          }


                                        }
                                      },

                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 0.03.sh
                                      ),
                                      keyboardType: TextInputType.number,

                                      decoration: InputDecoration(

                                          isDense: true,
                                          isCollapsed: true,

                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.greenAccent)),
                                          disabledBorder:  UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.greenAccent)),
                                          focusedBorder:  UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.greenAccent)),

                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: AppColors.mainColor
                                              )
                                          )

                                      ),
                                    )),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(unit,style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 0.03.sh
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )

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
                      if (valid) {
                        widget.profileAdditionalInformationModel.weight=weight;
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProblemPickerScreen(profileModel: widget.profileModel, profileAdditionalInformationModel: widget.profileAdditionalInformationModel,),));

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
