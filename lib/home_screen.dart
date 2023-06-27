import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Random random = Random();
  var firstColor;
  var secondColor;

  List<int> colorValues = [];

  @override
  void initState() {
    for(int i=0; i<=7; i++) {
      colorValues.add(random.nextInt(256));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Colors.primaries[Random().nextInt(Colors.primaries.length)],
    firstColor = Color.fromARGB(colorValues[0], colorValues[1], colorValues[2], colorValues[3]);
    secondColor = Color.fromARGB(colorValues[4], colorValues[5], colorValues[6], colorValues[7]);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              firstColor, secondColor
              // Color.fromARGB(113, 201, 336, 207),
              // Color.fromARGB(113, 201, 336, 207),
              // Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ],
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              updateColor();
            },
            child: Text('Tap'),
          ),
        ),
      )
    );
  }

  void updateColor() {
    setState(() {
      colorValues.clear();
      for(int i=0; i<=7; i++) {
        colorValues.add(random.nextInt(256));
      }
      firstColor = Color.fromARGB(colorValues[0], colorValues[1], colorValues[2], colorValues[3]);
      secondColor = Color.fromARGB(colorValues[4], colorValues[5], colorValues[6], colorValues[7]);
    });

    print('F: $firstColor, L: $secondColor');
  }
}
