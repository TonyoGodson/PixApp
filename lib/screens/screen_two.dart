import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      appBar: AppBar(title: Text("Screen Two"), centerTitle: true, leading: Icon(Icons.arrow_back),),
      body: Center(
        child: Container(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$s_OneArg"),
            SizedBox(height: 20.0,),
            SizedBox(
            child: (quotes == null)
                ? CircularProgressIndicator()
                : Text(quotes),),

          ],
        ),),
      ),
    );
  }
}
