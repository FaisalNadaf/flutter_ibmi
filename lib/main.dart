import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/pages/historyPage.dart';
import 'package:ibmi/pages/homePage.dart';
import 'package:ibmi/pages/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'IBMI',
      initialRoute: '/',
      routes: {
        '/': (BuildContext _context) => Mainpage(),
        '/history': (BuildContext _context) => Historypage(),
      },
    );
  }
}
