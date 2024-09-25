import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ibmi/widgets/shadowContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Historypage extends StatefulWidget {
  @override
  _HistorypageState createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  late double _deviceWidth, _deviceHeight;
  SharedPreferences? _preferences;
  String? _date;
  List<String>? _data;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _date = _preferences?.getString('date');
      _data = _preferences?.getStringList('data');
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    if (_date != null && _data != null) {
      DateTime _parseDate = DateTime.parse(_date!);
      return Center(
        child: ShadowContainer(
          height: _deviceHeight * 0.26,
          width: _deviceWidth * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                _data![1],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              Text(
                '${_parseDate.day}/${_parseDate.month}/${_parseDate.year}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                double.parse(_data![0])
                    .toStringAsFixed(2), // Display the rounded height
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: CupertinoActivityIndicator(
          color: Colors.blue,
        ),
      );
    }
  }
}
