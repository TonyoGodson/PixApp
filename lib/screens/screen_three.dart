import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  static const routeName = '/screen_three';

  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Three"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text("Screen three")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) => Container(
                  height: 250,
                  padding: EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Task Pane",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const Divider(thickness: 2, color: Colors.white,),
                      const SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.transparent)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            hintText: "Enter Task",
                            filled: false,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        child: Row(children: [
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ElevatedButton(
                                  child: const Text("Clear", style: TextStyle(color: Colors.blue)),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                                    ),
                                  onPressed: () {},
                                )),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                                  ),
                                  child: const Text("Ok", style: TextStyle(color: Colors.blue)),
                                  onPressed: () {},
                                )),
                          ),
                        ]),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
