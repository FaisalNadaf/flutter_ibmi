import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ibmi/pages/historyPage.dart';
import 'package:ibmi/pages/homePage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

List<Widget> _tasks = [
  Homepage(),
  Historypage(),
];

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'IBMI',
        ),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'history',
              ),
            ],
          ),
          tabBuilder: (context, index) {
            return _tasks[index];
          }),
    );
  }
}
