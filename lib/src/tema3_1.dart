import 'dart:ui';

//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //AudioCache _audioCache = AudioCache();

  List<LanguageBox> languageBox = <LanguageBox>[
    LanguageBox('Hello', 'hello_en_gb_1.mp3'),
    LanguageBox('Hello(france)', 'bonjour_fr_fr_1.mp3'),
    LanguageBox('My name is', 'audio_3.mp3'),
    LanguageBox('My name is(france)', 'audio_7.mp3'),
    LanguageBox('How are you?', 'audio_4.mp3'),
    LanguageBox('How are you?(france)', 'audio_8.mp3'),
    LanguageBox("I'm good", 'audio_5.mp3'),
    LanguageBox("I'm good(france)", 'audio_9.mp3'),
    LanguageBox('Goodbye!', 'audio_6.mp3'),
    LanguageBox('Goodbye(france)', 'audio_10.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Phrases'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: languageBox.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blueAccent,
            ),
            child: Center(
              child: GestureDetector(
                child: Text(
                  languageBox[index].text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                onTap: () {
                  //_audioCache.play(languageBox[index].audio);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class LanguageBox {
  LanguageBox(this.text, this.audio);

  final String text;
  final String audio;
}
