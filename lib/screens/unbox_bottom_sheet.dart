import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:start_up_project/utils/colors.dart';



class BottomUnboxSheet extends StatefulWidget {
  const BottomUnboxSheet({Key? key}) : super(key: key);

  @override
  State<BottomUnboxSheet> createState() => _BottomUnboxSheetState();
}

class _BottomUnboxSheetState extends State<BottomUnboxSheet> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
 void initState() {
    _controller=AnimationController(vsync: this,);
    super.initState();
  }
  bool animated=false;
  bool done=false;
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 0.6.sh,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(0.03.sh),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
                color: Colors.white
          ),
          child: Wrap(
            children: [
           !done? GestureDetector(
                onTap: () {

                },
                child: Center(child: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_0oco6l9x.json",width: 0.3.sh,animate: animated,
                controller: _controller,onLoaded: (p0) {
                    setState(() {
                      _controller
                        ..duration = Duration(seconds: 5)
                        ..forward().whenComplete(() {
                          done=true;
                          setState(() {

                          });
                        });
                    });
                },
                ))):Container(),
       done?   Column(
            children: [
              Center(child: Text("Congratulation",style: Theme.of(context).textTheme.headlineSmall,)),
              SizedBox(height: 20,),
              Center(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(

                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5)
                ),
                height: 0.05.sh,

                child: Center(
                  child: Text(
                    "EPIC",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
                  ),
                ),
              )),
              Container(
                height: 20,
              ),
              const Center(child: Text("You gain a 321 coin ,just for test purpose "),),
SizedBox(height: 0.2.sh,),
              Container(
                width: 0.7.sw,
                
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStatePropertyAll(AppColors.darkGreen)
                    ),
                    onPressed: () {
Navigator.of(context).pop();
                }, child: Text("Done")),
              )
            ],
          ):Container(),
            ],
          )

      ),
    );
  }
}
