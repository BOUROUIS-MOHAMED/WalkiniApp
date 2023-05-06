import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnboxScreen extends StatefulWidget {
  const UnboxScreen({Key? key}) : super(key: key);

  @override
  State<UnboxScreen> createState() => _UnboxScreenState();
}

class _UnboxScreenState extends State<UnboxScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_0oco6l9x.json"),
    );
  }
}
