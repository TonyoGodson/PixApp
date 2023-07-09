import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pix_app/screens/screen_three.dart';

class ScreenTwo extends StatefulWidget {
  static const routeName = '/screen_two';
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  bool quotesController = false;
  String quotes = '';
  Future<String?> getQuotes() async {
    try{
      var url = Uri.parse('https://api.kanye.rest/');
      var response = await http.get(url);
      var result = json.decode(response.body);
      return (result["quote"]);
    } catch (e){
      print(e);
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    if(!quotesController) {
      quotesController = true;
      getQuotes().then((value) {
        setState(() {
          quotes = value!;
        });
      });
    }
    var s_OneArg = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Two"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back
          ),
          onPressed: (){
            Navigator.of(context).pop();
            },),
        actions:  [Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: (){},
                child: const Icon(Icons.arrow_forward))),],
      ),
      body: Center(
        child: Container(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$s_OneArg"),
                SizedBox(height: 20.0,),
                SizedBox(
                  child: (quotes == null)
                      ? CircularProgressIndicator(
                    color: Colors.blue,
                  )
                      : Text(quotes),)
              ],
            )),
           // Expanded(child: SizedBox()),
           SizedBox(
             width: MediaQuery.of(context).size.width * .8,
             child: Padding(padding: const EdgeInsets.only(bottom: 20.0),
               child: ElevatedButton(
                 child: Text("Next"),
                 style: ButtonStyle(
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),)
                   )
                 ),
                 onPressed: () {
                   Navigator.of(context).pushNamed(ScreenThree.routeName);
                 },
               ),
             ),
           )
          ],
        ),),
      ),
    );
  }
}
