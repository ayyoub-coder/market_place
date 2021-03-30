import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_place/test/provider/google_sign_in.dart';

import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
       color: Colors.blueGrey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logged In with Facebook',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(user.photoURL),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ${user.email == ''?'ayoub@gmail.com':user.email}' ,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            RaisedButton(
              color: Color(0xFF0072ff),
              onPressed: () {
                print('*****************${user.email}');
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.facebookLogout();
                provider.logout();
              },
              child: Text('Logout',style: TextStyle(
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }

}
