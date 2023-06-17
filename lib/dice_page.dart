import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // Here we want to use a function to simplify the code we have written earlier
  void changeDiceFace() {
    setState(() {
      // leftDiceNumber = 3;
      //  Now i want to make sure that when i click on the cube it randomly generates any number from 1-6
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      //  We have to add 1 outside of 6 because we don't have an image that is zero, if we try it we notce that when our image goes to 0 it disappers and that's because we don't have an image that is zero.So we add  for the value to stay within 1-6
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  changeDiceFace();
                },
                child: Image.asset('assets/images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  changeDiceFace();
                },
                child: Image.asset('assets/images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
          // Trying Media Query here
          // Expanded(
          //   child: Text('$screenwidth,$screenheight'),
          // ),
        ],
      ),
    );
  }
}
