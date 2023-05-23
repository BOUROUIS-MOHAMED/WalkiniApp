import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:start_up_project/constants.dart';
import 'package:start_up_project/controllers/box_controller.dart';
import 'package:start_up_project/screens/profile/profil_screen.dart';
import 'package:start_up_project/screens/tasks/task_card.dart';
import 'package:start_up_project/screens/unbox_bottom_sheet.dart';
import 'package:start_up_project/utils/colors.dart';

import '../controllers/initialDataController.dart';
import '../models/box_model.dart';
import '../utils/hex color.dart';
import '../widgets/showAwesomeSnackBar.dart';

class BoxMainScreen extends StatefulWidget {
  const BoxMainScreen({Key? key}) : super(key: key);

  @override
  State<BoxMainScreen> createState() => _BoxMainScreenState();
}

class _BoxMainScreenState extends State<BoxMainScreen> {
  
  List<BoxModel> boxModelList= [];


  Future<List> initData() async {
  List  boxModelList=await GetStorage().read(Constants.boxModelKey)??[];
  print(boxModelList);
    return boxModelList;
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initData(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return  Text(snapshot!.error.toString());
            } else if (snapshot.hasData) {
              return  Scaffold(
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
                                  GestureDetector(
                                    onTap: () async {
                                      var conn = await Get.find<InitialDataController>().getInitialData();
                                      print(conn.message);
                                      if (conn.thereIsAnError==false) {


                                        //    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(),));
                                        print("dataRestoredSuccessfully");



                                      }else{
                                        showAwesomeSnackBar(context, "Error", conn.message!, Colors.redAccent, Colors.red);
                                        print("there is a problem : ${conn.message}");
                                      }
                                    },
                                    child: Text("Open Boxes",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        color: Colors.white
                                    ),),
                                  ),
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
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:snapshot.data!.length ,
                                        itemBuilder: (context, index) {
                                          BoxModel box=BoxModel.fromJson( snapshot.data![index]);
                                          return Padding(
                                            padding: EdgeInsets.only(right: 10,top: 20),
                                            child: Container(
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
                                                    GestureDetector(
                                                      onTap: () async {

                                                      },
                                                      child: Center(child: Text(box.name!,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                          color: Colors.white
                                                      ),)),
                                                    ),
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
                                                      GestureDetector(
                                                        onTap: (){
                                                          setState(() {
                                                            double res=0.0;
                                                            if(box.buyInEmerald){
                                                             res= (profileModel!.emeraldBalance!-box!.emeraldPrice!);
                                                            }else{
                                                              res=(profileModel.coinBalance!-box!.coinPrice!);
                                                            }
                                                            if(res>0.0){
                                                              Get.find<BoxController>().openBox(box.id!,profileModel.id!,);
                                                            }else{
                                                              showNormalSnackBar(context, "you don't have enouth credit", Colors.black, Colors.red);
                                                            }
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
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                          box.buyInEmerald?
                                                              box.emeraldPrice.toString():box.coinPrice.toString()
                                                          ,style: TextStyle(
                                                                fontSize: 0.02.sh

                                                            ),),
                                                            SizedBox(width: 10,),
                                                            box.buyInEmerald?
                                                            Image.asset(
                                                              "assets/coins/emerald.png",width: 0.03.sh,
                                                            ):
                                                            Image.asset(
                                                              "assets/coins/coins.png",width: 0.03.sh,
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                    )
                                                  ],
                                                )
                                            ),
                                          );
                                        },)
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
                          child: Column(
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
                        )
                        ,
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },



    );
  }
}
