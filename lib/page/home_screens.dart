import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_place/page/auth/logged_in_widget.dart';
import 'package:market_place/page/auth/login_screen.dart';
import 'package:market_place/page/auth/provider/google_sign_in.dart';


import 'package:provider/provider.dart';

class HomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final  provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return LoggedInWidget();
              } else {
                return  LoginScreen();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF3a7bd5),
                  Color(0xFF0072ff),
                  Color(0xFF0072ff),

                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Center(child: CircularProgressIndicator(backgroundColor : Colors.white,valueColor:new AlwaysStoppedAnimation<Color>(Color(0xFF0072ff)), )),
        ],
      );
}
