// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Login'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hii \nPleaser Google Sign in',textAlign: TextAlign.center,),
            InkWell(
              onTap: () {
                signInWithGoogle();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.deepPurpleAccent,
                ),
                child: Text('Google Login',style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        )
      ),
    );
  }
  signInWithGoogle() async {
    // trigger the authenticate flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>['email']
    ).signIn();
    // obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    // create a new credentials
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
