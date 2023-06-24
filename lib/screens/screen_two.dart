import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  static const routeName = '/screen_two';
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    var s_OneArg = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: Center(
        child: Container(child:
        Text("$s_OneArg"),),
      ),
    );
  }
}
