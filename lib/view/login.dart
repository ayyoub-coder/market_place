


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:market_place/repository/authentication.dart';

 

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  Authentication authentication = Authentication();

  var formKey = GlobalKey<FormState>();

  bool _loading =false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign In",style: Theme.of(context).textTheme.headline3),
                  SizedBox(height: 16,),
                  Text('Login to  continue to  your account'),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: _loginForm(context)),

              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
                  color: Colors.blue,
                  child:(_loading)?Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.white,),
                  ): Text("Login",style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white,fontSize: 22),),
                  onPressed: (_loading) ?null :null,
                ),
              ),
              Row(
                children: [
                  Text("Don't have Account?"),
                  FlatButton(

                    child: Text('Sign Up'),
                    onPressed: (){
                      //Todo: Send them  to  the sign Up screen
                    },
                  ),
                  FlatButton(

                    child: Text('google Sign Up'),
                    onPressed: (){
                     // signInWithGoogle();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

/*  Future<void> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(authCredential);

    FirebaseUser users = await _auth.currentUser();
    print('user email = ${users.email}');
  }
*/
  Widget _loginForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                hintText: "Email"
            ),
            validator: (value) => (value.isEmpty) ? "emil is required" : null,
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password"
            ),
            validator: (value) => (value.isEmpty) ? "emil is required" : null,
          ),

        ],
      ),
    );
  }

 /* void _loginUser() async {
    if(formKey.currentState.validate()){
      setState(() {
        _loading = true;
      });
    }
    String email = _emailController.text;
    String password = _passwordController.text;
    User user = await authentication.login(email, password);
    if(user !=null){
      setState(() {
        _loading = false;
      });
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    }else{
      setState(() {
        _loading = false;
      });
    }

  }*/
}
