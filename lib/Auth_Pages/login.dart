import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Widgets/text_fields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController  _emailController = new TextEditingController();
  TextEditingController  _passwordController = new TextEditingController();
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

              // Button Login
              GestureDetector(
                onTap: (){
                  // loggingIn();
                },
                child: Container(
                  child: Text('Log In'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      color: Colors.blue,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ) ),

                ),
              ),
              Flexible(child: Container(),flex: 2,),
              // Transitioning to signing up.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Don't Have an Account?")),
                  InkWell(
                    onTap: (){
                     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUp(),));
                    },
                    child: Container(padding: const EdgeInsets.symmetric(vertical: 8),child:  const Text(" Sign Up",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );;
  }
}
