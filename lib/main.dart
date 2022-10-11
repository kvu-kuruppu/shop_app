import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants/routes.dart';
import 'package:shop_app/firebase_options.dart';
import 'package:shop_app/screens/bottom_bar.dart';
import 'package:shop_app/screens/on_board_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

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
