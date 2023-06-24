import 'package:flutter/material.dart';
import 'package:pix_app/screens/screen_two.dart';

class ScreenOne extends StatefulWidget {
  static const routeName = '/screen_one';
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  var _input;

  @override
  void initState(){
    super.initState();
    _input = TextEditingController();
  }

  @override
  void dispose(){
    _input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen One"), centerTitle: true, leading: const Icon(Icons.arrow_back),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(child:
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.93,
                  child: TextField(
                    controller: _input,
                  )),),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.93,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                        ScreenTwo.routeName,
                        arguments: _input.text,
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)
                      )
                    )
                  ), child: Text("Next")
                ))
          ],
        ),
      ),
    );
  }
}
