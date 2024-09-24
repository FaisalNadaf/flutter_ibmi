import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final double height, width;
  final Widget child;

  ShadowContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Get the device height and width from MediaQuery
    

    // Constrain the Container's size based on device dimensions
    return SizedBox(
      height:  height, // Constrain the height
      width:  width,    // Constrain the width
      child: Container(
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
        child: child,
      ),
    );
  }
}
