import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:start_up_project/utils/colors.dart';

class SubscriptionReminderScreen extends StatefulWidget {
  const SubscriptionReminderScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionReminderScreen> createState() => _SubscriptionReminderScreenState();
}

class _SubscriptionReminderScreenState extends State<SubscriptionReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,

        leading:Icon( Icons.close,color: Colors.black,),

      ),
      body: Stack(
        children: [

          Positioned(
              left: 10,
              right: 10,
              top: 0.0.sh,
              child: Center(
                child: Text("Exclusive offer!",style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.kanit().fontFamily
          ),),
              )),
          Positioned(
              left: 10,
              right: 10,
              top: 0.09.sh,
              child: Center(
                child: Text("119.99 £",style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.kanit().fontFamily,
                  decoration: TextDecoration.lineThrough
                ),),
              )),
          Positioned(
              left: 10,
              right: 10,
              top: 0.2.sh,
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset("assets/gift.json",width: 0.2.sh),
                    SizedBox(height: 20,),
                    Text("19.99 £",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.kanit().fontFamily,

                    ),),
                    Text("For annual access ",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.kanit().fontFamily,

                    ),),
                    SizedBox(
                      height: 0.1.sh,
                    ),
                    Container(
                      height: 0.06.sh,
                      width: 1.sw,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:MaterialStatePropertyAll(Colors.greenAccent.shade200),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))
                          ),
                          onPressed: () {

                      }, child: Text(
                          "Buy now",style: TextStyle(
                        fontSize: 0.03.sh
                      ),
                      )),
                    )
                  ],
                )
              )),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child:  Center(

                child: Column(
                  children: [
                    Text("By purchase, you accept our",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black45,

                      fontFamily: GoogleFonts.kanit().fontFamily,

                    ),),
                    Text("Policy,Use condition and Factorization condition",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black45,

                      fontFamily: GoogleFonts.kanit().fontFamily,

                    ),),
                  ],
                ),
              ),)


        ],
      ),
    );
  }
}
