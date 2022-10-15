import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/auth/widgets/custom_background.dart';
import 'package:tchombe/app/auth/widgets/custom_header.dart';
import 'package:tchombe/app/auth/widgets/custom_textfield.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomHeaderLogo(),
                Column(
                  children: [
                    const Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sign up to account',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 20),
                    const CustomRoundTextField(
                      hintText: 'your email',
                      icon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 20),
                    const CustomRoundTextField(
                      hintText: 'your password',
                      icon: Icon(Icons.password),
                    ),
                    const SizedBox(height: 20),
                    /*                  Row(
                      children: [
                        Expanded(child: Container()),
                        Text(
                          'forgot password ?',
                          style:
                          TextStyle(fontSize: 20, color: Colors.grey[500]),
                        ),
                      ],
                    ),*/
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: width * 0.5,
                  height: height * 0.09,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: const Center(
                    child: Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                      text: 'Have account ? ',
                      style: TextStyle(color: Colors.grey[500]),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                          text: 'Sign in',
                          style:const  TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                SizedBox(height: height * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.facebook_outlined,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 10,),
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.facebook_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                )
/*                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                      text: 'Not account yet ?',
                      style: TextStyle(color: Colors.grey[500]),
                      children: const [
                        TextSpan(
                          // recognizer: GestureRecognizer(),
                          text: 'Sign up',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
