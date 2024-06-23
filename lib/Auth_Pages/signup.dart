import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/Auth_Pages/AuthMethods.dart';

import '../Widgets/text_fields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController  _emailController = new TextEditingController();
  TextEditingController  _passwordController = new TextEditingController();
  TextEditingController  _usernameController = new TextEditingController();
  TextEditingController  _bioController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32,),
          width: double.infinity,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Svg Image
              const SizedBox(height: 25,),
              Flexible(child: Container(),flex: 1,),
              SvgPicture.asset('images/ic_instagram.svg',height: 64,color: Colors.white,),
              //Text Field for Email
              const SizedBox(height: 64,),

              TextFields(
                hintText: "Enter Email",
                ispassword: false,
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,

              ),
              // Text Field For Password
              const SizedBox(height: 20,),
              TextFields(
                hintText: "Enter Password",
                ispassword: true,
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,

              ),
              const SizedBox(height: 20,),

              TextFields(
                hintText: "UserName",
                ispassword: true,
                textEditingController: _usernameController,
                textInputType: TextInputType.visiblePassword,

              ),
              const SizedBox(height: 20,),

              TextFields(
                hintText: "BIO",
                ispassword: false,
                textEditingController: _bioController,
                textInputType: TextInputType.visiblePassword,

              ),
              const SizedBox(height: 20,),

              // Button Login
              GestureDetector(
                onTap: (){
                  // loggingIn();
                  Authentication().signUpUser(email: _emailController.text.toString(), password: _passwordController.text.toString(), username:_usernameController.text.toString() ,
                      bio: _bioController.text.toString(), context: context);
                },
                child: Container(
                  child: Text('SignUp',style: TextStyle(color: Colors.white),),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding:const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      color: Colors.blue,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ) ),

                ),
              ),
              Flexible(child: Container(),flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Already Have an Account?",style: TextStyle(color: Colors.white),)),
                  InkWell(
                    onTap: (){
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUp(),));
                    },
                    child: Container(padding: const EdgeInsets.symmetric(vertical: 8),child:  const Text(" Login In",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
