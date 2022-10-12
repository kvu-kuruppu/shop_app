import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final double scrollPosition;
  final int dots;

  const DotsIndicatorWidget({
    Key? key,
    required this.scrollPosition,
    required this.dots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dots,
      position: scrollPosition,
      decorator: const DotsDecorator(
        color: Colors.grey,
        activeColor: Color.fromARGB(255, 33, 53, 167),
        spacing: EdgeInsets.all(8.0),
        size: Size.square(6),
        activeSize: Size(12, 6),
      ),
    );
  }
}
