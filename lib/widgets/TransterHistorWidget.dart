import 'package:flutter/material.dart';
import 'package:start_up_project/widgets/CardWidget.dart';

import 'RoundedButton.dart';


class TransterHistorWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final String date;
  final String value;

  final BalanceType balanceType;
  final Color color;
  TransterHistorWidget(
      {required this.iconData,
      required this.text,
      required this.date,
      required this.value,
      required this.balanceType,
      required this.color,});

  @override
  Widget build(BuildContext context) {

    return ListTile(

      title: Text(text),
      subtitle: Text(date),
      leading: RoundedButton(iconData: iconData, color: color),
      trailing: Text(value),
    );
  }
}