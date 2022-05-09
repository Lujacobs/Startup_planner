// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'dart:ffi';
import 'dart:html';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  var data = readJson();
  runApp(const MyApp());
}
 // https://www.kindacode.com/article/how-to-read-local-json-files-in-flutter/

Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/Events.json');
  final data = await json.decode(response);
  return data;
}

// #docregion MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup agenda',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Startup agenda interface'),
          ),
          // #docregion itemBuilder
          body: ListView(
            // This next line does the trick.
            scrollDirection: Axis.vertical,
            children: <Widget>[
              rowWidget(DateTime.utc(2022,2,2), "title", true),// data[1]["title"], true),
              rowWidget(DateTime.utc(2022,2,2), 'Meeting Met de Merte', true),
              Container(
                height: 160.0,
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                height: 160.0,
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                height: 160.0,
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                height: 160.0,
                width: 160.0,
                color: Colors.yellow,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Agenda Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Groups',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            selectedItemColor: Colors.deepPurpleAccent,
          ),


          ),
    );
  }
// #enddocregion RWS-build
// #docregion RWS-var
}
// widget that is custom based on Time and name
rowWidget( DateTime date, String title, bool present){
  return Row(
    children:  <Widget>[

      Expanded(
        child: Column( children : [
          Icon(Icons.date_range, color: Colors.grey),
          Text(date.toString(),  textAlign: TextAlign.center,),]
        )
      ),
      Expanded(
        child: Text(title,  textAlign: TextAlign.center),
      ),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Icon(Icons.task_alt, color: Colors.green),
          ),
        ),

      // if(present){
      //   return Icon(Icons.task_alt),
      // }else{
      //   return Icon(Icons.task_alt),
      // }

    ],

  );

}

// temp loader for a file <- will be moved server side in the futer


