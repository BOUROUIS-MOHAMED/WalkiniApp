import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/CardWidget.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/TransterHistorWidget.dart';


class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131313),
      appBar: AppBar(
        backgroundColor: Color(0xFF131313),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.more_horiz,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'BALANCE',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),

                  ],
                ),
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CardWidget(
                      gradientBegin: Alignment.topLeft,
                      gradiendEnd: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFf3a8b0),
                        const Color(0xffff4e4e)
                      ],
                      text: "Coin",
                      value: "7120",
                      balanceType:BalanceType.coin ,
                    ),
                    SizedBox(width: 10.0),
                    CardWidget(
                      gradientBegin: Alignment.topLeft,
                      gradiendEnd: Alignment.bottomLeft,
                      colors: [
                        const Color(0xFFadf6de),
                        const Color(0xFF6eead2)
                      ],
                      text: "Emerald",
                      value: "3001.2301 ",
                      balanceType: BalanceType.emerald,
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RoundedButton(
                      iconData: Iconsax.document_download,
                      color: Colors.green,
                    ),
                    // SizedBox(width: 20.0),
                    RoundedButton(
                      iconData: Iconsax.document_upload,
                      color: Colors.pink,
                    ),
                    // SizedBox(width: 20.0),
                    RoundedButton(
                      iconData: Iconsax.card,
                      color: Colors.white,
                    ),
                    // SizedBox(width: 20.0),
                    RoundedButton(
                      iconData: Iconsax.undo,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                " HISTORY",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TransterHistorWidget(
                        iconData: Iconsax.buy_crypto,
                        text: "Buy",
                        date: "15 Aug",
                        value: "0.0002 ",
                        balanceType: BalanceType.coin,
                        color: Colors.green),

                    TransterHistorWidget(
                      iconData: Iconsax.buy_crypto,
                      text: "Buy",
                      date: "13 Aug",
                      value: "-0.0004 LTC",
                      balanceType: BalanceType.coin,
                      color: Colors.pink,
                    ),
                    TransterHistorWidget(
                      iconData: Iconsax.add,
                      text: "add",
                      date: "14 Aug",
                      value: "+0.0050 LTC",
                      balanceType: BalanceType.coin,
                      color: Colors.pink,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}