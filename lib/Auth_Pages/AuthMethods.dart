import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instagram/AppPages/Home.dart';
import 'package:http/http.dart' as http;
class Authentication
{
      FirebaseAuth _auth = FirebaseAuth.instance;
      
  Future <String> signUpUser({
    required String email,
    required String password,
    required String username,
     
    required Uint8List? imgFile,
    required BuildContext context,


  })async{
      String res = "some error occured";
     try {

       if(email.isNotEmpty && password.isNotEmpty && username.isNotEmpty  ){
  UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password).whenComplete(()async {
    //  String PROFILE_IMG_URL = await imageUploader(imgFile!);
     String PROFILE_IMG_URL = await imageUploader(imgFile!);
    FirebaseFirestore.instance.collection("Users").doc(_auth.currentUser!.uid.toString()).set({
       
        "PROFILE_IMG": PROFILE_IMG_URL
    });
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
  },);

       
      return res;

       }
     }catch (e){
     }
     return res;
}
// Uploading Image to Firebase Storage:



FirebaseAuth auth = FirebaseAuth.instance;

Future<String> imageUploader (Uint8List imgfile)async{

Reference  ref =  FirebaseStorage.instance.ref().child("profileImages").child(_auth.currentUser!.uid.toString());

UploadTask uploadTask = ref.putData(imgfile);

TaskSnapshot taskSnapshot  = await uploadTask;
String URL = await taskSnapshot.ref.getDownloadURL();
return URL;
}

}