import 'package:flutter/material.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          onPageChanged: (value) {},
          children: const [
            Text(
              '1',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              '2',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              '3',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              '4',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
