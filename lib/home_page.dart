// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0,),
              // Image.network(
              //   FirebaseAuth.instance.currentUser!.photoURL!,
              // ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.redAccent,
                ),
                child: Image.network(
                  FirebaseAuth.instance.currentUser!.photoURL!,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(FirebaseAuth.instance.currentUser!.displayName!),
              const SizedBox(height: 10.0,),
              Text(FirebaseAuth.instance.currentUser!.email!),
              const SizedBox(height: 10.0,),
              InkWell(
                onTap: () {
                  signOut();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.red,
                  ),
                  child: Text('Logout',style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )
      ),
    );
  }
  signOut(){
    FirebaseAuth.instance.signOut();
  }
}
