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
import 'package:start_up_project/screens/auth/additionalData/loading_screen.dart';
import 'package:start_up_project/utils/colors.dart';


class ProblemPickerScreen extends StatefulWidget {
   ProblemPickerScreen({Key? key,required this.profileModel,required this.profileAdditionalInformationModel}) : super(key: key);
ProfileModel profileModel=ProfileModel();
ProfileAdditionalInformationModel profileAdditionalInformationModel=ProfileAdditionalInformationModel();
  @override
  State<ProblemPickerScreen> createState() => _ProblemPickerScreenState();
}
List selectedContainer=[];

var localParser = EmojiParser(init: false);




class _ProblemPickerScreenState extends State<ProblemPickerScreen> {
  @override
  void initState() {
    localParser.initLocalData();
    super.initState();
  }
  List problems=[
    "nothing",
    "Health problem",
    "Hardware problem",
    "handicaps",
    "Other",
  ];
  List problemsEmoji=[
    Icons.close,
    Iconsax.health,
    Icons.smartphone_rounded,
    Icons.accessible_rounded,
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
                  flex: 1,
                  child: Text("Do you have any \nproblem?",

                    textAlign: TextAlign.center,
                    style: GoogleFonts.farro(
                        fontWeight: FontWeight.w400,
                        fontSize: 0.03.sh
                    ),),),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,

                            physics: NeverScrollableScrollPhysics(),
                            itemCount: problems.length,

                            itemBuilder:(context, index)  {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        if (index!=0) {
                                          if (selectedContainer.contains(0)) {
                                            selectedContainer.remove(0);
                                          }
                                          if (selectedContainer.contains(index)) {
                                            selectedContainer.remove(index);
                                          }else{
                                            selectedContainer.add(index);
                                          };
                                        }  else{
                                          if (selectedContainer.contains(index)) {
                                            selectedContainer.remove(index);
                                          } else{
                                            selectedContainer=[];
                                            selectedContainer.add(index);
                                          }
                                        }

                                      });
                                    },
                                    child: Container(

                                      width: 0.9.sw,
                                      height: 0.1.sh,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:(selectedContainer.contains(index))? AppColors.mainColor:AppColors.gray,
                                            width:selectedContainer.contains(index)? 3:1
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: ListTile(
                                          leading: Icon(problemsEmoji[index],color: Colors.amber),
                                          title: Text(problems[index].toUpperCase(),style: GoogleFonts.farro(
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
                      if (selectedContainer.isNotEmpty) {
                        String s="";
                        for (var element in selectedContainer) {
                          s=s+problems[element];
                        }
                        widget.profileAdditionalInformationModel.problems=s;
                        problems.length>0?
                        widget.profileAdditionalInformationModel.hadProblems=true
                        :
                        widget.profileAdditionalInformationModel.hadProblems=false;

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreen(profileModel: widget.profileModel, profileAdditionalInformationModel: widget.profileAdditionalInformationModel,),));


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
