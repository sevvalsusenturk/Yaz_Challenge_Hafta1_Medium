import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( 
        appBar: AppBar(
          backgroundColor: Colors.green.shade600,
          title: Text('En Çok Tekrar Eden Harf Bulucu'),
        ),
        body: Center(
          child: TextInputWidget(),
        ),
      ),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  TextEditingController _textController = TextEditingController();

  String _mostRepeatedCharacter = '';
  int _repeatedCount = 0;

  void findMostRepeatedCharacter() {
    String inputText = _textController.text;
    if (inputText.isEmpty) {
      setState(() {
        _mostRepeatedCharacter = '';
        _repeatedCount = 0;
      });
      return;
    }

    Map<String, int> characterCount = {};

    for (int i = 0; i < inputText.length; i++) {
      String char = inputText[i];
      characterCount[char] = (characterCount[char] ?? 0) + 1;
    }

    String mostRepeated = '';
    int maxCount = 0;

    characterCount.forEach((char, count) {
      if (count > maxCount) {
        mostRepeated = char;
        maxCount = count;
      }
    });

    setState(() {
      _mostRepeatedCharacter = mostRepeated;
      _repeatedCount = maxCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: TextField(
            controller: _textController,
            onChanged: (text) {
              findMostRepeatedCharacter();
            },
            decoration: InputDecoration(
              labelText: 'Metni Girin',
            ),
          ),
        ),
        SizedBox(height: 20),
        Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: [
              Text(
          'En Çok Tekrar Eden Harf: $_mostRepeatedCharacter',
          style: TextStyle(fontSize: 18),
        ),
            ]),
            ),
        ),
        
        SizedBox(height: 10),
        Text(
          'Tekrar Sayısı: $_repeatedCount',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
