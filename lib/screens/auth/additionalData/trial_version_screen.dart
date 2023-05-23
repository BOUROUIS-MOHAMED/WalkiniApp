import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icon.dart';
import 'package:start_up_project/screens/permissions/permission%20widgets/activity_tracker_permission_widget.dart';
import 'package:start_up_project/utils/colors.dart';
import 'package:timelines/timelines.dart';


class TrialVersionScreen extends StatefulWidget {
  const TrialVersionScreen({Key? key}) : super(key: key);

  @override
  State<TrialVersionScreen> createState() => _TrialVersionScreenState();
}
int selectedContainer=4;

var localParser = EmojiParser(init: false);




class _TrialVersionScreenState extends State<TrialVersionScreen> {

  bool trialVersionActivator=false;

  @override
  Widget build(BuildContext context) {
   final data = _data(0);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,
        leading: Icon(CupertinoIcons.chevron_back,color: Colors.black,),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 0.07.sw),
            child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActivityTrackerPermissionWidget(),));
                },
                child: Icon(Icons.close,color: Colors.black.withOpacity(0.3),)),
          )
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child:Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(

                    children: [
                      Text("Active your pass right now!\nto earn free week",


                        textAlign: TextAlign.left,
                        style: GoogleFonts.farro(
                            fontWeight: FontWeight.w400,
                            fontSize: 0.025.sh
                        ),),
                      Center(
                        child: Container(
                          width: 0.5.sh,

                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,

                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [


                                _DeliveryProcesses(processes: data.deliveryProcesses),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Text("This pass start from 9.9£ monthly(2.2£ weekly),\n"
                          "cancel it any time",textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.grey
                      ),) ,
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 0.9.sw
                        ,height: 0.07.sh
                        ,decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(55)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Activate the trial version"),
                        FlutterSwitch(
                          width: 0.18.sw,
                          height: 0.1.sh,
                          valueFontSize: 10.0,
                          toggleSize: 15.0,
                          value: trialVersionActivator,
                          borderRadius: 30.0,
                          padding: 10.0,
                          showOnOff: true,
                          activeColor: AppColors.mainColor,
                          inactiveColor: Colors.grey.shade400,
                          onToggle: (val) {
                            setState(() {
                              trialVersionActivator = val;
                            });
                          },

                      ),
                            

                          ],
                        ),


                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Text("You have a promo code ?,",textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.grey,decoration: TextDecoration.underline
                        ),),
                      ),
                      Divider(),
                    ],
                  ),

                ),
                Expanded(
                  flex: 0,
                 child: Container(



                 ),
                ),
                Flexible(
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
                )

              ],
            )

        ),
      ),

    );
  }





}



class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
  });
  final List<_DeliveryMessage> messages;
  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
            thickness: 1.0,
          ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
            size: 10.0,
            position: 0.5,
          ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
          !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }
            return Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
          isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}
class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);
  final List<_DeliveryProcess> processes;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 12.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: AppColors.purpleColor,
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;
              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      processes[index].name,
                      style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: 18.0,
                      ),
                    ),
                    _InnerTimeline(messages: processes[index].messages),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return DotIndicator(
                  color: Color(0xff66c97f),
                  child: Icon(
                    Iconsax.unlock,
                    color: Colors.white,
                    size: 12.0,
                  ),
                );
              } else {
                return OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: processes[index].isCompleted ? Color(0xff66c97f) : null,
            ),
          ),
        ),
      ),
    );
  }
}

_OrderInfo _data(int id) => _OrderInfo(
  id: id,
  date: DateTime.now(),
  driverInfo: _DriverInfo(
    name: 'Philipe',
    thumbnailUrl:
    'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
  ),
  deliveryProcesses: [
    _DeliveryProcess(
      'Today',
      messages: [
        _DeliveryMessage('Unlock premium access for free'),

      ],
    ),
    _DeliveryProcess(
      'After 5 days',
      messages: [
        _DeliveryMessage('You will recieve a notification with a email to make you know your pass status'),

      ],
    ),
    _DeliveryProcess(
      'After 7 days',
      messages: [
        _DeliveryMessage('Your membership will start,you can cancel it any time'),

      ],
    ),
    _DeliveryProcess.complete(),
  ],
);
class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });
  final int id;
  final DateTime date;
  final _DriverInfo driverInfo;
  final List<_DeliveryProcess> deliveryProcesses;
}
class _DriverInfo {
  const _DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });
  final String name;
  final String thumbnailUrl;
}
class _DeliveryProcess {
  const _DeliveryProcess(
      this.name, {
        this.messages = const [],
      });
  const _DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];
  final String name;
  final List<_DeliveryMessage> messages;
  bool get isCompleted => name == 'Done';
}
class _DeliveryMessage {
  const _DeliveryMessage( this.message);
  // final DateTime createdAt;
  final String message;
  @override
  String toString() {
    return '$message';
  }
}
