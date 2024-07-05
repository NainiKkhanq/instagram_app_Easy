import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/Auth_Pages/AuthMethods.dart';

import '../Widgets/text_fields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _bioController = new TextEditingController();
  bool showProgressIndicator = false;
  Uint8List? _img;
  String ProfileImageURL ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Svg Image
              const SizedBox(
                height: 25,
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              SvgPicture.asset(
                'images/ic_instagram.svg',
                height: 64,
                color: Colors.white,
              ),
              //Text Field for Email
              const SizedBox(
                height: 25,
              ),

              Stack(children: [
                 _img!=null?CircleAvatar(
                  radius: 70,
                  backgroundImage: MemoryImage(_img!)
                ):const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage("https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/149197250/original/e91f8ca9de6e762865d3c20959e544f07bb760cc/create-a-simple-professional-profile-picture-for-you.png"),
                ),
                Positioned(
                  top: 110,
                  left: 50,
                  right: 50,
                  child: InkWell(
                    onTap: (){
                      selectImage();
                    },
                    child: const Icon(Icons.camera_alt_rounded,size: 30,color: Colors.white,)))

              ],),
              const SizedBox(
                height: 25,
              ),

              TextFields(
                hintText: "Enter Email",
                ispassword: false,
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
              ),
              // Text Field For Password
              const SizedBox(
                height: 20,
              ),
              TextFields(
                hintText: "Enter Password",
                ispassword: true,
                textEditingController: _passwordController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 20,
              ),

              TextFields(
                hintText: "UserName",
                ispassword: true,
                textEditingController: _usernameController,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 20,
              ),

             
              const SizedBox(
                height: 20,
              ),
              // Button Login
              GestureDetector(
                onTap: () {
                  // loggingIn();
                  setState(() {
                    showProgressIndicator = true;
                  });
                  Authentication().signUpUser(
                      email: _emailController.text.toString(),
                      password: _passwordController.text.toString(),
                      username: _usernameController.text.toString(),
                      imgFile: _img,
                     
                      context: context);
                  Timer.periodic(
                    Duration(seconds: 5),
                    (timer) {
                      setState(() {
                        showProgressIndicator =false;
                      });
                    },
                  );
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SignUp',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10,),
                      Transform.scale(
                        scale: 0.5,
                        
                        child: showProgressIndicator
                            ? CircularProgressIndicator(strokeWidth: 5,color: Colors.white,)
                            : Text(""),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)))),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Already Have an Account?",
                        style: TextStyle(color: Colors.white),
                      )),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUp(),));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        " Login In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
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
  selectImage()async{
      
    Uint8List profileImage = await pickImage();
    setState(() {
      _img = profileImage;
      

    });
  }

  pickImage()async{

      final ImagePicker _imagePicker = ImagePicker();
      XFile? _xFile = await _imagePicker.pickImage(source: ImageSource.gallery);

      if(_xFile!=null){
        return await _xFile.readAsBytes();

      }else{
        print("No Image Choose");
      }
      
  }
}
