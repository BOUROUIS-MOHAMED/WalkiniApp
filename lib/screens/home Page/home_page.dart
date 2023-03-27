import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_up_project/utils/colors.dart';
import 'package:start_up_project/widgets/eventContainer.dart';
import 'package:start_up_project/widgets/homeAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
 var todaySteps;
 String userStatus="pause";
 late AnimationController _animationController;



  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    todaySteps=  (GetStorage().read("steps")??"ERROR").toUpperCase();
    userStatus= ( GetStorage().read("pedestrianStatus")??"ERROR").toUpperCase();
    return  SafeArea(
      child: Scaffold(


        backgroundColor: AppColors.appWhite,
        body: SingleChildScrollView(
          child: Container(

            width: 1.sw,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 0.03.sw,vertical: 0.01.sh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      HomeAppBar(),
                        SizedBox(height: 0.02.sh),

                        Container(

                          width: 0.9.sw,
                          height: 0.27.sh,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Expanded(
                                flex: 10,
                                child: Container(


                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(30.r)

                                  ),
                                  child:
                                  Padding(
                                    padding:  EdgeInsets.all(0.05.sw),
                                    child: Column
                                      (

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(

                                          children: [
                                            Icon(FontAwesomeIcons.shoePrints,size: 0.03.sw,color: Colors.white,),
                                            SizedBox(width: 0.03.sw,),
                                            Text("Steps Today",style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                              color: Colors.white
                                            ),)
                                          ],
                                        ),
                                        Container(
                                          height: 0.1.sh,
                                          decoration: BoxDecoration(
                                            color: Colors.white24,

                                          ),

                                        ),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(todaySteps.toString(),style: Theme.of(context).textTheme.headline5!.copyWith(
                                             color: Colors.white
                                         ),),
                                         Text("of 8000",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                             color: Colors.white
                                         )),
                                       ],
                                     )
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container()),
                              Expanded(

                                flex: 10,

                                child: Container(
                                  height: 0.27.sh,
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 0.6.sw,
                                        height: (0.25.sh/2),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                              width: 0.5
                                                  ,
                                              color: Colors.grey
                                            ),

                                            borderRadius: BorderRadius.circular(25.r)
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Weekly Steps",style: Theme.of(context).textTheme.headline6!.copyWith(
                                              color: AppColors.iconColor2
                                            ),),
                                            Text(todaySteps.toString(),style: Theme.of(context).textTheme.headline5!.copyWith(
                                              color: Colors.black
                                            ),)
                                          ],
                                        ),


                                      ),
                                      Container(
                                        width: 0.6.sw,
                                        height: (0.25.sh/2),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                width: 0.5
                                                ,
                                                color: Colors.grey
                                            ),

                                            borderRadius: BorderRadius.circular(25.r)
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("status",style: Theme.of(context).textTheme.headline4!.copyWith(
                                                color: AppColors.darkGreen

                                            ),),
                                            Text(userStatus,style: Theme.of(context).textTheme.headline5!.copyWith(
                                                color: Colors.black
                                            ),)
                                          ],
                                        ),


                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 0.02.sh),
                        SizedBox(
                          height: 0.3.sh,
                          child: Swiper(
                            itemCount: 4,
                            autoplay: true,
                            autoplayDelay: 10000,
                            scale: 0.5,
                            autoplayDisableOnInteraction: true,
                            duration: 1500,
                            loop: true,
                            curve: Curves.easeIn,

                            layout: SwiperLayout.DEFAULT,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                semanticContainer: true,
                                elevation: 10,

                                margin:  EdgeInsets.all(

                                  10

                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r)
                                ),
                                child: EventContainerModel(
                                  "assets/banner.jpg",
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                ),
                              );
                            },
                          ),
                        ),


                        SizedBox(height: 0.04.sh),
                        Text("History",style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black
                        ),),
                        SizedBox(height: 0.02.sh),
                        Column(

                          children: [
                            Container(
height: 0.3.sh
                          ,





                              child: ListView.builder(
                              itemCount: 4
                              ,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index){

                                  return ListTile(


                          leading: Container(
                          width: 0.06.sh,



                                  decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius: BorderRadius.circular(10.r)
                                  ),
                          )
                          ,
                                    subtitle: Text("Event description"),
                                    title: Text("Event"),
                                    dense: true,
                                    trailing: TextButton(
                                      onPressed: (){},
                                      child: Text("Ceck   >"),
                                    ),


                                  );
                                }
                              ),
                            )
                          ],
                        )



                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
