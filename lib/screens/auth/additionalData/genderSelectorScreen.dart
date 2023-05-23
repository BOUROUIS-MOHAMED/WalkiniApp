import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/screens/auth/additionalData/birthday_picker_screen.dart';
import 'package:start_up_project/utils/colors.dart';


class GenderSelectorScreen extends StatefulWidget {
   GenderSelectorScreen({Key? key,required this.profileModel}) : super(key: key);
   NormalUserModel profileModel=NormalUserModel();
  @override
  State<GenderSelectorScreen> createState() => _GenderSelectorScreenState();
}
int selectedContainer=4;
bool valid=false;

var localParser = EmojiParser(init: false);




class _GenderSelectorScreenState extends State<GenderSelectorScreen> {
@override
  void initState() {
  localParser.initLocalData();
    super.initState();
  }
List genders=[
  "Male",
  "Female",
  "Other",
];
List gendersEmoji=[
  Iconsax.man,
  Iconsax.woman,
  Iconsax.information
];
var coffee = Emoji('coffee', '☕');
var heart  = Emoji('heart', '❤️');

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
                flex: 3,
                child: Text("What is your\ngender?",

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
                          itemCount: genders.length,

                          itemBuilder:(context, index)  {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectedContainer=index;
                                      if (selectedContainer<3) {
                                        valid=true;
                                      }
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
                                        leading: Icon(gendersEmoji[index],color: Colors.amber),
                                        title: Text(genders[index].toUpperCase(),style: GoogleFonts.farro(
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
                      widget.profileModel.gender=genders[selectedContainer];
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BirthdayPickerScreen(profileModel: widget.profileModel),));
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
