import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  double height, width;
  Widget child;

  ShadowContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });
  late double _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          ),
        ],
      ),
      height: _deviceHeight! * height,
      width: _deviceWidth! * width,
      child: child,
    );
  }
}
