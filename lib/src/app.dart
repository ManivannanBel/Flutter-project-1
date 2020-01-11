import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/ImageModel.dart';

class App extends StatefulWidget{

  createState(){
    return AppState();
  }
  
}

class AppState extends State<App>{
  int counter = 0;

  void fetchImage() async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
  }

  Widget build(context){
      return MaterialApp(
        home: Scaffold(
        body: Text('$counter'),
        appBar: AppBar(
          title: Text('Hi mani the great'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_alert),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}