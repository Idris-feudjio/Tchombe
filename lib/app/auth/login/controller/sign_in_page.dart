import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/auth/register/sign_up_form.dart';
import 'package:tchombe/app/auth/widgets/custom_background.dart';
import 'package:tchombe/app/auth/widgets/custom_header.dart';
import 'package:tchombe/app/auth/widgets/custom_textfield.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String test ;
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
                      'Login',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sign to account',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 20),
                    const CustomRoundTextField(hintText: 'your email',icon: Icon(Icons.email)),
                    const SizedBox(height: 20),
                    const CustomRoundTextField(hintText: 'your password',icon: Icon(Icons.password)),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Text(
                          'forgot password ?',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[500]),
                        ),
                      ],
                    ),
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
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: height * .1),
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                      text: 'Not account yet ? ',
                      style: TextStyle(color: Colors.grey[500]),
                      children: [
                        TextSpan(
                           recognizer: TapGestureRecognizer()..onTap=()=>Get.to(const SignUpForm()),
                          text: 'Sign up',
                          style:const  TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
