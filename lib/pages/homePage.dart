import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/shadowContainer.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  int _age = 18;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: _ageSelecter(),
      ),
    );
  }

  Widget _ageSelecter() {
    return ShadowContainer(
      height: 0.3,
      width: 0.6,
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
              fontSize: 50,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _age--;
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
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
          )
        ],
      ),
    );
  }
}
