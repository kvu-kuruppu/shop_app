import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context)
          .pushNamedAndRemoveUntil(onBoardScreenRoute, (route) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'SHOP',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 120,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'APP',
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
