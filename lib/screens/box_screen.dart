import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:start_up_project/screens/tasks/task_card.dart';
import 'package:start_up_project/screens/unbox_bottom_sheet.dart';
import 'package:start_up_project/utils/colors.dart';

class BoxMainScreen extends StatefulWidget {
  const BoxMainScreen({Key? key}) : super(key: key);

  @override
  State<BoxMainScreen> createState() => _BoxMainScreenState();
}

class _BoxMainScreenState extends State<BoxMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: 1.sh,
        width: 1.sw,
        color: AppColors.background,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                      ,
                  color: Colors.lightBlue.shade900,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Earn daily coin",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white
                        ),),
                        SizedBox(height: 10,),
                        Text("Spend more than 5 minutes in Walkini, \nto earn up to 5 coin daily ",maxLines: 3,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white
                        ),),
                        Padding(
                          padding:  EdgeInsets.only(left:0.5.sw,top: 0.00.sh),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(AppColors.appBlack),
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ))
                              ),
                              onPressed: () {
                                setState(() {
                                  var sheetController = showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                     isDismissible: false,
                                     isScrollControlled: false,
                                      shape: RoundedRectangleBorder(

                                        borderRadius: BorderRadius.circular(25),

                                      ),
                                      context: context,
                                      builder: (context) => BottomUnboxSheet());

                                  sheetController.then((value) {});
                                });

                          }, child: Text("Claim Reward",style: TextStyle(
                            color: AppColors.white
                          )),),
                        )
                      ],
                    ),
                  ],
                ),
              )
              ,
              Container(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                  ,
                  color: AppColors.darkGreen,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Open Boxes",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white
                        ),),
                        SizedBox(height: 10,),
                        Text("Spend your coin and emerald in lucky box\n"
                            "what if you find something valuable ?",maxLines: 3,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white
                        ),),
                        Container(
width: 0.8.sw,
                          height: 0.5.sh,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                            ,
                            color: AppColors.darkGreen,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                               Container(
                                 padding: EdgeInsets.all(10),
                                 width: 0.5.sw,
                                 height: 0.4.sh,
                                 decoration: BoxDecoration(
                                   color: Colors.black,
                                   borderRadius: BorderRadius.circular(15)
                                 ),
                                 child:  Wrap(

                                   children: [
                                     Container(
                                       width: 0.5.sw,
                                       height: 0.27.sh,
                                       decoration: BoxDecoration(

                                           borderRadius: BorderRadius.circular(15)
                                       ),
                                     child: Center(
                                       child: Lottie.asset("assets/gift.json",animate: false,width: 0.3.sh),
                                     ),
                                     ),
                                     Center(child: Text("Legendary",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                       color: Colors.white
                                     ),)),
                                     Container(
                                       width: double.infinity,
                                       child: ElevatedButton(

                                           style: ButtonStyle(
                                             backgroundColor: MaterialStatePropertyAll(AppColors.purpleColor),
                                             shape: MaterialStatePropertyAll(
                                               RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(25)
                                               )
                                             )
                                           ),
                                           onPressed: () {

                                       }, child:
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Text("50",style: TextStyle(
                                             fontSize: 0.02.sh

                                           ),),
                                           SizedBox(width: 10,),
                                           Image.asset(
                                             "assets/emerald.png",width: 0.03.sh,
                                           )
                                         ],
                                       )),
                                     )
                                   ],
                                 )
                               ),
                                SizedBox(width: 10,),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    width: 0.5.sw,
                                    height: 0.4.sh,
                                    decoration: BoxDecoration(
                                        color: Colors.purple.shade400,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child:  Wrap(

                                      children: [
                                        Container(
                                          width: 0.5.sw,
                                          height: 0.27.sh,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(
                                            child: Lottie.asset("assets/gift.json",animate: false,width: 0.2.sh),
                                          ),
                                        ),
                                        Center(child: Text("Legendary",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                            color: Colors.white
                                        ),)),
                                        Container(
                                          width: double.infinity,
                                          child: ElevatedButton(

                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll(AppColors.purpleColor),
                                                  shape: MaterialStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(25)
                                                      )
                                                  )
                                              ),
                                              onPressed: () {

                                              }, child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("2000",style: TextStyle(
                                                  fontSize: 0.02.sh

                                              ),),
                                              SizedBox(width: 10,),
                                              Image.asset(
                                                "assets/coins.png",width: 0.03.sh,
                                              )
                                            ],
                                          )
                                          ),
                                        )
                                      ],
                                    )
                                ),
                                SizedBox(width: 10,),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    width: 0.5.sw,
                                    height: 0.4.sh,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow.shade700,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child:  Wrap(

                                      children: [
                                        Container(
                                          width: 0.5.sw,
                                          height: 0.27.sh,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(
                                            child: Lottie.asset("assets/gift.json",animate: false,width: 0.15.sh),
                                          ),
                                        ),
                                        Center(child: Text("Rare",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                            color: Colors.white
                                        ),)),
                                        Container(
                                          width: double.infinity,
                                          child: ElevatedButton(

                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll(AppColors.purpleColor),
                                                  shape: MaterialStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(25)
                                                      )
                                                  )
                                              ),
                                              onPressed: () {

                                              }, child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("1000",style: TextStyle(
                                                  fontSize: 0.02.sh

                                              ),),
                                              SizedBox(width: 10,),
                                              Image.asset(
                                                "assets/coins.png",width: 0.03.sh,
                                              )
                                            ],
                                          )),
                                        )
                                      ],
                                    )
                                ),
                                SizedBox(width: 10,),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    width: 0.5.sw,
                                    height: 0.4.sh,
                                    decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child:  Wrap(

                                      children: [
                                        Container(
                                          width: 0.5.sw,
                                          height: 0.27.sh,
                                          decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(
                                            child: Lottie.asset("assets/gift.json",animate: false,width: 0.1.sh),
                                          ),
                                        ),
                                        Center(child: Text("COMMON",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                            color: Colors.white
                                        ),)),
                                        Container(
                                          width: double.infinity,
                                          child: ElevatedButton(

                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll(AppColors.purpleColor),
                                                  shape: MaterialStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(25)
                                                      )
                                                  )
                                              ),
                                              onPressed: () {

                                              }, child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("500",style: TextStyle(
                                                  fontSize: 0.02.sh

                                              ),),
                                              SizedBox(width: 10,),
                                              Image.asset(
                                                "assets/coins.png",width: 0.03.sh,
                                              )
                                            ],
                                          )),
                                        )
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(height: 10,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                  ,
                  color: Colors.redAccent.shade100,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Complete tasks to earn coin",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white
                        ),),
                        SizedBox(height: 10,),
                        Text("Complete your tasks to earn coin, \nand join the leader board ",maxLines: 3,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white
                        ),),
                        Padding(
                          padding:  EdgeInsets.only(left:0.5.sw,top: 0.00.sh),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(AppColors.appBlack),
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ))
                            ),
                            onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) => TasksListCard(),));
                            }, child: Text("Complete tasks",style: TextStyle(
                              color: AppColors.white
                          )),),
                        )
                      ],
                    ),
                  ],
                ),
              )
              ,
            ],
          ),
        ),
      ),
    );
  }
}
