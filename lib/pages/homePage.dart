import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/shadowContainer.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _age = 18;
  int _weight = 140;
  double _height = 70;
  int _gender = 0;

  late double _deviceWidth, _deviceHeight;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: _deviceHeight * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ageSelecter(),
                  _weightSelecter(),
                ],
              ),
              _heightSelector(),
              _genderSelector(),
              _calculateBmiBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ageSelecter() {
    return ShadowContainer(
      height: _deviceHeight * 0.18,
      width: _deviceHeight * 0.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Age yr',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            _age.toString(),
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w6 00,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                // Constrain the width of the button
                child: CupertinoDialogAction(
                  onPressed: () {
                    if (_age > 0) {
                      setState(() {
                        _age--;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 10), // Spacing between buttons
              Expanded(
                // Constrain the width of the button
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _age++;
                    });
                  },
                  child: const Icon(
                    Icons.add_outlined,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weightSelecter() {
    return ShadowContainer(
      height: _deviceHeight * 0.18,
      width: _deviceHeight * 0.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Weight lbs',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            _weight.toString(),
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w6 00,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                // Constrain the width of the button
                child: CupertinoDialogAction(
                  onPressed: () {
                    if (_weight > 0) {
                      setState(() {
                        _weight--;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 10), // Spacing between buttons
              Expanded(
                // Constrain the width of the button
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _weight++;
                    });
                  },
                  child: const Icon(
                    Icons.add_outlined,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double roundToTwoDecimals(double value) {
    return (value * 10).round() / 10; // Rounds the value to two decimal places
  }

  Widget _heightSelector() {
    return ShadowContainer(
      height: _deviceHeight * 0.18,
      width: _deviceWidth * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Height in',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            roundToTwoDecimals(_height)
                .toString(), // Display the rounded height
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w6 00,
            ),
          ),
          CupertinoSlider(
            value: roundToTwoDecimals(
                _height), // Use the rounded height for the slider
            min: 0,
            max: 96,
            onChanged: (_value) {
              setState(() {
                _height =
                    _value; // Update _height with the new value from the slider
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _genderSelector() {
    return ShadowContainer(
      height: _deviceHeight * 0.14,
      width: _deviceWidth * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Gender',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          CupertinoSlidingSegmentedControl(
              groupValue: _gender,
              children: {
                0: Text('Male'),
                1: Text('Female'),
              },
              onValueChanged: (_value) {
                setState(() {
                  _gender = _value as int;
                });
              })
        ],
      ),
    );
  }

  Widget _calculateBmiBtn() {
    return CupertinoButton(
      color: Colors.blue,
      child: const Text(
        'Calculate',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (_height > 0 && _weight > 0 && _age > 0) {
          double _bmi = 703 * (_weight / pow(_height, 2));
          print(_bmi);
        }
      },
    );
  }
}
