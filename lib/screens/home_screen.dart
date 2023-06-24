import 'package:flutter/material.dart';
import 'package:pix_app/screens/screen_one.dart';
import 'package:pix_app/screens/screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> dummyList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PixxAppy"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: GridView(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: dummyList
                  .map((e) => Card(
                        color: Colors.blue,
                        elevation: 30.0,
                        shadowColor: Colors.blue,
                        child: Center(
                            child: Text(
                          "$e",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        )),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.93,
            child: ElevatedButton(
                onPressed: () {
                    Navigator.of(context).pushNamed(ScreenOne.routeName);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                  )
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20.0),
                ),
            ),
          )
        ],
      ),
    );
  }
}
