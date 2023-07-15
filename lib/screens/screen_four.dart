import 'package:flutter/material.dart';

import '../widgets/nav_drawer.dart';
import '../widgets/tabs.dart';

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
      drawer: NavDrawer(),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.red,
        title: const Text("Screen Four"),),
        body: ClientTab()
    );
  }
}
