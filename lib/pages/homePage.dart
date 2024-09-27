import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/pages/historyPage.dart';
import 'package:ibmi/utils/calculate.dart';
import 'package:ibmi/widgets/shadowContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _age = 18;
  double _weight = 160;
  double _height = 70;
  int _gender = 0;

  late double _deviceWidth, _deviceHeight;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Center(
        child: SizedBox(
          height: _deviceHeight * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ageSelector(),
                  _weightSelector(),
                ],
              ),
              _heightSelector(),
              _genderSelector(),
              _calculateBmiBtn(),
              // _historyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ageSelector() {
    return ShadowContainer(
      height: _deviceHeight * 0.2,
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
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CupertinoDialogAction(
                  key: const Key('age_minus'),
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
              Expanded(
                child: CupertinoDialogAction(
                  key: const Key('age_plus'),
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

  Widget _weightSelector() {
    return ShadowContainer(
      height: _deviceHeight * 0.2,
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
            _weight.toInt().toString(), // Display weight as an integer
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CupertinoDialogAction(
                  key: const Key('weight_minus'),
                  onPressed: () {
                    if (_weight > 0) {
                      setState(() {
                        _weight -= 1;
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
              Expanded(
                child: CupertinoDialogAction(
                  key: const Key('weight_plus'),
                  onPressed: () {
                    setState(() {
                      _weight += 1;
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

  double roundToOneDecimal(double value) {
    return (value * 10).round() / 10; // Rounds the value to one decimal place
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
            roundToOneDecimal(_height).toString(),
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
          CupertinoSlider(
            value: _height,
            min: 0,
            max: 96,
            onChanged: (value) {
              setState(() {
                _height = value;
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
            children: const {
              0: Text('Male'),
              1: Text('Female'),
            },
            onValueChanged: (value) {
              setState(() {
                _gender = value as int;
              });
            },
          ),
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
          double bmi = calculateBMI(_weight, _height);
          showDialogBox(bmi);
        }
      },
    );
  }

  void showDialogBox(double bmi) {
    String status;
    if (bmi < 18.5) {
      status = "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      status = "Normal";
    } else if (bmi >= 25 && bmi <= 30) {
      status = "Overweight";
    } else {
      status = "Obese";
    }

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(status),
          content: Text(bmi.toStringAsFixed(2)),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                _saveResult(bmi.toString(), status);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _historyButton() {
    return CupertinoButton(
      color: Colors.grey,
      child: const Text(
        'History',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => Historypage()),
        );
      },
    );
  }

  void _saveResult(String bmi, String status) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString('date', DateTime.now().toString());
    await preference.setStringList('data', <String>[bmi, status]);
    print('result saved');
        developer.log("\x1B[32mBMI Result Saved!\x1B[0m");
  }
}
