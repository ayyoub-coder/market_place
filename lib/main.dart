import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'file:///C:/Users/hp/Desktop/codanews/market_place/lib/test/login_screen.dart';

import 'package:market_place/page/page.dart';
import 'package:market_place/repository/authentication.dart';
import 'package:market_place/test/home_page.dart';
import 'package:market_place/view/login.dart';

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
      home: HomePage(),

    );
  }
}
