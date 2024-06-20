//import 'package:drone_based_crop_monitoring/pages/Home.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Home.dart';
import 'package:flutter_application_1/pages/SignUp.dart';
import 'package:flutter_application_1/pages/forgetpassword.dart';
import 'package:flutter_application_1/pages/reuse/assets.dart';
import 'package:flutter_application_1/pages/reuse/my_buttons.dart';
import 'package:flutter_application_1/pages/reuse/reusable.dart';
import 'package:flutter_application_1/shared/textfield.dart';

import 'constants.dart';

class Login extends StatefulWidget {

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var obscureText = true;
  @override
  void dispose() {
    emailTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }
  bool isVisable = true;
  bool _isLoading = false;
  void submitFormOnLogin() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();
      setState(() {
        _isLoading=true;
      });
      try
      {
        await authInstance.signInWithEmailAndPassword(
            email:emailTextController.text.toLowerCase().trim() ,
            password:passTextController.text.trim());
        navigateTo(context, Home());
        print('succesfully logged in');
      }
      on FirebaseException catch(error)
      {
        errorDialog(
          subtitle:'${error.message}' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      } catch(error)
      {
        errorDialog(
          subtitle:'$error' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      }finally{
        setState(() {
          _isLoading=false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Scaffold(
          
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsData.dron,
                    height: 100,
                    width: 100,
                  ),
                  const Text(
                    text,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 21,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                CustomTextField(
                      labelText: 'E-Mail',
                      controller: emailTextController,
                      inputType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return 'Please enter a valid email address';
                        }else
                        {
                          return null;
                        }
                      },
                    ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                CustomTextField(
                        controller: passTextController,
                        obscureText: obscureText,
                        validator: (value){
                          if(value!.isEmpty || value.length<7){
                            return 'Please enter a valid Password';
                          }else
                          {
                            return null;
                          }
                        },
                        labelText: 'Password',
                        inputType: TextInputType.text,

                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            obscureText=!obscureText;
                          });
                        },
                        child: Icon(
                          obscureText?
                          Icons.visibility:Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                 MyButton(
                    color: kcolor7,
                    title: 'Login',
                       onPressed: ()  {
                        
                            submitFormOnLogin();
                    },
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                            navigateTo(context,ForgetPasswordScreen());
                        },
                        child: const Text(
                          'Forget Password? ',
                          style: TextStyle(
                            fontSize: 18,
                            color: kcolor6,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: const Text(
                          "Sign Up ",
                          style: TextStyle(
                            fontSize: 18,
                            color: kColor3,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
