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
  final TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  int? number;
  String message = 'init';

  bool _isSquare(int number) {
    for (int i = 0; i < number / 2; i++) {
      if (i * i == number) {
        return true;
      }
    }
    return false;
  }

  bool _isTriangular(int number) {
    for (int i = 0; i < number / 3; i++) {
      if (i * i * i == number) {
        return true;
      }
    }
    return false;
  }

  Future<void> _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${number!}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Shapes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Please input a number to see if it is square or triangle',
                textAlign: TextAlign.start,
                textScaleFactor: 1.8,
              ),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                focusNode: focusNode,
                decoration: InputDecoration(
                  errorText: errorText,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              number = int.tryParse(controller.text);
              if (number == null) {
                errorText = "It's not a number!";
              } else {
                controller.clear();
                focusNode.unfocus();
                if (_isSquare(number!)) {
                  if (_isTriangular(number!)) {
                    message = 'Number $number is both  SQUARE and TRIANGULAR';
                  } else {
                    message = 'Number $number is SQUARE';
                  }
                } else {
                  if (_isTriangular(number!)) {
                    message = 'Number $number is TRIANGULAR';
                  } else {
                    message = 'Number $number is neither SQUARE or TRIANGULAR';
                  }
                }
                _showMyDialog();
              }
            },
          );
        },
      ),
    );
  }
}
