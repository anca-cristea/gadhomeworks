import 'dart:math';
import 'dart:ui';

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
  String? errorText;
  String? guessText;
  final TextEditingController controller = TextEditingController();
  int number = Random().nextInt(99) + 1;
  int? guessNumber = 0;
  FocusNode focusNode = FocusNode();
  bool playAgain = true;

  Future<void> _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('You guessed the number.\n Do you want to play again?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                setState(() {
                  playAgain = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess my number'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              "I'm thinking of a number between 1 and 100!",
              textAlign: TextAlign.center,
              textScaleFactor: 2.2,
            ),
            const Text(
              "It's your turn to guess my number.",
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
            ),
            if (guessText != null)
              Text(
                guessText!,
                textAlign: TextAlign.center,
                textScaleFactor: 2.2,
              ),
            Card(
              shadowColor: Colors.blue,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Try a number!',
                      textAlign: TextAlign.center,
                      textScaleFactor: 2.2,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      focusNode: focusNode,
                      readOnly: !playAgain,
                      decoration: InputDecoration(
                        enabled: playAgain,
                        errorText: errorText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            guessNumber = int.tryParse(controller.text);
                            if (guessNumber == null) {
                              errorText = "It's not a number";
                            } else {
                              errorText = null;
                              if (guessNumber! > number) {
                                guessText = 'You tried $guessNumber\n Try lower';
                              } else {
                                if (guessNumber! < number) {
                                  guessText = 'You tried $guessNumber\n Try higher';
                                } else {
                                  guessText = null;
                                  _showMyDialog();
                                  if (playAgain) {
                                    number = Random().nextInt(99) + 1;
                                  }
                                }
                              }
                            }
                            controller.clear();
                            focusNode.unfocus();
                          },
                        );
                      },
                      child: const Text(
                        'Guess',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
