import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icon.dart';
import 'package:start_up_project/models/profile_additional_information_model.dart';
import 'package:start_up_project/models/profile_model.dart';
import 'package:start_up_project/screens/auth/additionalData/height_picker_screen.dart';
import 'package:start_up_project/utils/colors.dart';


class GoalsSelectorScreen extends StatefulWidget {
   GoalsSelectorScreen({Key? key,required this.profileModel}) : super(key: key);
  ProfileModel profileModel=ProfileModel();

  @override
  State<GoalsSelectorScreen> createState() => _GoalsSelectorScreenState();
}
int selectedContainer=4;
bool valid=false;
var localParser = EmojiParser(init: false);




class _GoalsSelectorScreenState extends State<GoalsSelectorScreen> {
  @override
  void initState() {
    localParser.initLocalData();
    super.initState();
  }
  List goals=[
    "To earn money",
    "To track your steps",
    "Other",
  ];
  List goalsEmoji=[
    Iconsax.money,
    Icons.directions_run,
    Iconsax.information
  ];
  var coffee = Emoji('coffee', '☕');
  var heart  = Emoji('heart', '❤️');

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
                  flex: 3,
                  child: Text("What is your main\ngoal?",

                    textAlign: TextAlign.center,
                    style: GoogleFonts.farro(
                        fontWeight: FontWeight.w400,
                        fontSize: 0.03.sh
                    ),),),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,

                            physics: NeverScrollableScrollPhysics(),
                            itemCount: goals.length,

                            itemBuilder:(context, index)  {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        valid=true;
                                        selectedContainer=index;
                                      });
                                    },
                                    child: Container(

                                      width: 0.9.sw,
                                      height: 0.1.sh,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:index==selectedContainer? AppColors.mainColor:AppColors.gray,
                                            width:index==selectedContainer? 3:1
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: ListTile(
                                          leading: Icon(goalsEmoji[index],color: Colors.amber),
                                          title: Text(goals[index].toUpperCase(),style: GoogleFonts.farro(
                                            fontSize: 0.015.sh
                                          )),

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                      ),


                    ],
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: (){
                      if (valid&&selectedContainer<3) {
ProfileAdditionalInformationModel pDIM =ProfileAdditionalInformationModel(
  goals: goals[selectedContainer]
);
Navigator.of(context).push(MaterialPageRoute(builder: (context) => HeightPickerScreen(profileModel: widget.profileModel, profileAdditionalInformationModel: pDIM,),));

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
