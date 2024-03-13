import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(DictionaryApp());
}

class DictionaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search,
                  size: 37,
                  color: Color.fromARGB(255, 221, 175, 77)), // Add an icon
              SizedBox(width: 10), // Add some space
              Text(
                'MyDict!',
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 175, 77),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: DictionaryHomePage(),
      ),
    );
  }
}



              
            
