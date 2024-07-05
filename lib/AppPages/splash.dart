import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/AppPages/Home.dart';
import 'package:instagram/Auth_Pages/signup.dart';

class SPLASH extends StatefulWidget {
  const SPLASH({super.key});

  @override
  State<SPLASH> createState() => _SPLASHState();
}

class _SPLASHState extends State<SPLASH> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if(FirebaseAuth.instance.currentUser!=null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));

    }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp(),));

    }
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(height: 120, width: 120,"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/1200px-Instagram_logo_2016.svg.png"),
          )
        ],
      ),
    );
  }
  
}