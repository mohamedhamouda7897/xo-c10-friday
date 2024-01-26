import 'package:basics_c10_friday/basics/home_screen.dart';
import 'package:basics_c10_friday/calculator.dart';
import 'package:basics_c10_friday/counter/counter.dart';
import 'package:basics_c10_friday/slider/slider_screen.dart';
import 'package:basics_c10_friday/xo/login.dart';
import 'package:basics_c10_friday/xo/xo_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

///
/// [1,2,5,3,6,9,5,8]
/// index
/// Map<String , String > {"Key":"value"}
/// key

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {

        Login.routeName: (context) => Login(),
        SliderScreen.routeName: (context) => SliderScreen(),
        XoGame.routeName: (context) => const XoGame(),
      },
    );
  }
}
