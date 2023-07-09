import 'package:flutter/material.dart';

class ScreenFour extends StatefulWidget {
  static const routeName = '/screen_four';
  const ScreenFour({Key? key}) : super(key: key);

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Screen Four"),),
        body:Text("Screen Four"));
  }
}
