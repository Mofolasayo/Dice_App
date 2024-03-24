import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String diceImage = "assets/images/dice-1.png";
String diceImage1 = "assets/images/dice-1.png";
var deviceWidth;
var deviceHeight;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    int randomImage = Random().nextInt(6) + 1;
    int randomImage1 = Random().nextInt(6) + 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Dice App",
          style: TextStyle(fontSize: deviceWidth * 0.07, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 32, 77),
            Color.fromARGB(255, 1, 13, 53)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  singleDie(diceImage),
                  singleDie(diceImage1),
                  SizedBox(
                    height: deviceHeight * 0.15,
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      diceImage = "assets/images/dice-$randomImage.png";
                      diceImage1 = "assets/images/dice-$randomImage1.png";
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Roll Dice",
                    style: TextStyle(fontSize: deviceWidth * 0.06),
                  ))
            ],
          )),
    );
  }

  Widget singleDie(diceImage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          diceImage,
          width: deviceWidth * 0.25,
        ),
      ],
    );
  }
}
