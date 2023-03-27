import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:start_up_project/utils/colors.dart';

 subscriptionBottomSheet(BuildContext context){



  return showBottomSheet(
    elevation: 5,
    enableDrag: true,
    clipBehavior:Clip.hardEdge ,
   backgroundColor: AppColors.background,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
    ),
    context: context,
    builder: (context) {
      return   BottomPurchaseSheet();

    },);
}

class BottomPurchaseSheet extends StatefulWidget {
  const BottomPurchaseSheet({Key? key}) : super(key: key);

  @override
  State<BottomPurchaseSheet> createState() => _BottomPurchaseSheetState();
}

class _BottomPurchaseSheetState extends State<BottomPurchaseSheet> {
  bool monthly=true;
  List sub=[
    "monthly",
    "year"
  ];
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 0.6.sh,
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose Your Plan",style: GoogleFonts.outfit(
                      fontWeight: FontWeight.normal,
                      fontSize: 0.025.sh
                  ),),
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.close))
                ],
              ),
              GestureDetector(
                onTap: () {
setState(() {
  monthly=true;
});

                },
                child: Container(


                  width: 1.sw,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 2,
                          color: Colors.blue
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "MONTHLY",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.oxygen().fontFamily,
                              color: Colors.black38,
                            ),
                            ),
                           CircleAvatar(
                             radius: 10,
                             child:monthly? CircleAvatar(
                               radius: 5,
                               backgroundColor: AppColors.darkGreen,
                             ):null,
                           )
                          ],
                        ),
                        Text("9.99£/month",style: Theme.of(context).textTheme.titleLarge,),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text("1 week for free"),
                        ),
                        Text("Then 9.99£ per month,Cancel any time",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38
                        ),)
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 0.01.sh,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    monthly=false;
                  });

                },
                child: Container(


                  width: 1.sw,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 2,
                          color: Colors.blue
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ANNUALLY",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.oxygen().fontFamily,
                              color: Colors.black38,
                            ),
                            ),
                            CircleAvatar(
                              radius: 10,
                              child:!monthly? CircleAvatar(
                                radius: 5,
                                backgroundColor: AppColors.darkGreen,
                              ):null,
                            )
                          ],
                        ),
                        Text("99.9£/year",style: Theme.of(context).textTheme.titleLarge,),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text("2 months for free"),
                        ),
                        Text("Then 99.9£ per year,Cancel any time",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 0.1.sh,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 1.sw,
                  height: 0.07.sh,
                  decoration: BoxDecoration(

                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              AppColors.darkGreen
                          ),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              )
                          )
                      ),
                      onPressed: () {

                      }, child: Text(
                      "Continue to checkout"
                  )),
                ),
              )
            ],
          )

      ),
    );
  }
}
