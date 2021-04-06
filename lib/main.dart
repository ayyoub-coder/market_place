
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:market_place/page/home_screens.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) {

   return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreens(),

    );
  }
}
