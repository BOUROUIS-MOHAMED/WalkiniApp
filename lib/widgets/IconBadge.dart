import 'package:flutter/material.dart';

class IconBadge extends StatefulWidget {

  final IconData icon;
  final double size;
  int number;

  IconBadge({Key? key, required this.icon, required this.size,this.number=0})
      : super(key: key);


  @override
  _IconBadgeState createState() => _IconBadgeState();
}

class _IconBadgeState extends State<IconBadge> {

  @override
  Widget build(BuildContext context) {


    return

      Stack(
      children: <Widget>[
        Icon(
          widget.icon,
          size: widget.size,
        ),
        Positioned(
          right: 0.0,
          child:widget.number!=0? Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 13,
              minHeight: 13,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 1),
              child:Text(
               "${widget.number}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ):Container(
            padding: EdgeInsets.all(1),

            ),
          ),

      ],
    );
  }
}
