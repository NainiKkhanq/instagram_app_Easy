import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication
{
      FirebaseAuth _auth = FirebaseAuth.instance;
  Future <String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
     Uint8List? imgFile,
    required BuildContext context,


  })async{
      String res = "some error occured";
     try{

       if(email.isNotEmpty && password.isNotEmpty && username.isNotEmpty && bio.isNotEmpty && imgFile!=null){

         UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return res;

       }
     }catch (e){
     }
     return res;
}
}