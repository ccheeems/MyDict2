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

class DictionaryHomePage extends StatefulWidget {
  @override
  _DictionaryHomePageState createState() => _DictionaryHomePageState();
}

class _DictionaryHomePageState extends State<DictionaryHomePage> {
  String _currentWord = '';
  String _definition = '';
  TextEditingController _controller = TextEditingController();

  Future<void> _searchWord(String word) async {
    final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final String mainWord = data[0]['word'];
        final String phonetics =
            data[0]['phonetics'][0]['text'] ?? 'No phonetics available';
        final meanings = data[0]['meanings'];
        if (meanings.isNotEmpty) {
          final definitions = meanings[0]['definitions'];
          if (definitions.isNotEmpty) {
            final definition = definitions[0]['definition'];
            setState(() {
              _definition =
                  '$mainWord [$phonetics]:\n\n DEFINITION: \n $definition';
            });
            return;
          }
        }
      }
    } else {
      setState(() {
        _definition = 'Definition not found.';
      });
    }
  }
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a word'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),


              
            
