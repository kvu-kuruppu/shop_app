import 'package:flutter/material.dart';
import 'package:shop_app/constants/routes.dart';
import 'package:shop_app/screens/bottom_bar.dart';
import 'package:shop_app/screens/on_board_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: const SplashScreen(),
      routes: {
        onBoardScreenRoute: (context) => const OnBoardScreen(),
        bottomBarRoute: (context) => const BottomBar(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
