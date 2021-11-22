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
  List<Color> xo = <Color>[
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];
  int counter = 0;
  bool playAgain = false;

  bool _winner() {
    if (xo[0] == xo[1] && xo[0] == xo[2] && xo[0] != Colors.black) {
      xo[3] = xo[4] = xo[5] = xo[6] = xo[7] = xo[8] = Colors.black;
      return true;
    } else {
      if (xo[0] == xo[3] && xo[0] == xo[6] && xo[0] != Colors.black) {
        xo[1] = xo[2] = xo[4] = xo[5] = xo[7] = xo[8] = Colors.black;
        return true;
      } else {
        if (xo[0] == xo[4] && xo[0] == xo[8] && xo[0] != Colors.black) {
          xo[1] = xo[2] = xo[3] = xo[5] = xo[6] = xo[7] = Colors.black;
          return true;
        } else {
          if (xo[1] == xo[4] && xo[1] == xo[7] && xo[1] != Colors.black) {
            xo[0] = xo[2] = xo[3] = xo[5] = xo[6] = xo[8] = Colors.black;
            return true;
          } else {
            if (xo[2] == xo[4] && xo[2] == xo[6] && xo[2] != Colors.black) {
              xo[0] = xo[1] = xo[3] = xo[5] = xo[7] = xo[8] = Colors.black;
              return true;
            } else {
              if (xo[2] == xo[5] && xo[2] == xo[8] && xo[2] != Colors.black) {
                xo[0] = xo[1] = xo[3] = xo[4] = xo[6] = xo[7] = Colors.black;
                return true;
              } else {
                if (xo[3] == xo[4] && xo[3] == xo[5] && xo[3] != Colors.black) {
                  xo[0] = xo[1] = xo[2] = xo[6] = xo[7] = xo[8] = Colors.black;
                  return true;
                } else {
                  if (xo[6] == xo[7] && xo[6] == xo[8] && xo[6] != Colors.black) {
                    xo[1] = xo[2] = xo[3] = xo[4] = xo[5] = xo[6] = Colors.black;
                    return true;
                  } else {
                    return false;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tic-tac-toe'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: xo.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: xo[index],
                    borderRadius: BorderRadius.circular(xo[index] == Colors.black ? 0 : 16),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (counter.isEven && xo[index] == Colors.black) {
                            xo[index] = Colors.green;
                          } else if (xo[index] == Colors.black) {
                            xo[index] = Colors.red;
                          }
                          counter++;
                          playAgain = _winner();
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            if (playAgain || counter == 9)
              TextButton(
                onPressed: () {
                  setState(
                    () {
                      counter = 0;
                      playAgain = false;
                      xo = <Color>[
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black,
                        Colors.black
                      ];
                    },
                  );
                },
                child: const Text(
                  'Play Again!',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
