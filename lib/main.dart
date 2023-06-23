import 'package:flutter/material.dart';
import 'package:pix_app/screens/home_screen.dart';


void main(){
  runApp(const PixApp());
}
class PixApp extends StatefulWidget {
  const PixApp({Key? key}) : super(key: key);

  @override
  State<PixApp> createState() => _PixAppState();
}

class _PixAppState extends State<PixApp> {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: HomeScreen());
  }
}
