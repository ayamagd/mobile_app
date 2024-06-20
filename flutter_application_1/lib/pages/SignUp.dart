
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/reuse/assets.dart';
import 'package:flutter_application_1/pages/reuse/my_buttons.dart';
import 'package:flutter_application_1/pages/reuse/reusable.dart';
import 'package:flutter_application_1/shared/textfield.dart';


import 'Home.dart';
import 'constants.dart';

class SignUp extends StatefulWidget {

  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _phoneTextController = TextEditingController();

  bool _isLoading = false;
  bool _obscureText = true;
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }
  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading=true;
      });
      try
      {
        await authInstance.createUserWithEmailAndPassword(
            email:_emailTextController.text.toLowerCase().trim() ,
            password:_passTextController.text.trim());
        final User? user=authInstance.currentUser;
        final _uid=user!.uid;
        user.updateDisplayName(_fullNameController.text);
        user.reload();
        await FirebaseFirestore.instance.collection('users').doc(_uid).set({
          'id':_uid,
          'name':_fullNameController.text,
          'email':_emailTextController.text.toLowerCase(),
          'createdAt':Timestamp.now(),
         'shipping_address':_phoneTextController.text,
          'phone':'01002206237',
          'bio':'write your bio...',
          'image':'https://as1.ftcdn.net/v2/jpg/04/28/56/60/1000_F_428566061_Fkqaq0l831DXPM12Ixs9ds3waZWlCXHH.jpg',
        });
        navigateTo(context, Home());
        print('succesfully registered');
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
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsData.dron,
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    text,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field is missing";
                        } else {
                          return null;
                        }
                      },
                      controller: _fullNameController,
                      labelText: 'Full name',
                      inputType: TextInputType.name,
                      
                    ),

                  SizedBox(
                    height: height * 0.04,
                  ),
                CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Please enter a valid Email adress";
                        } else {
                          return null;
                        }
                      },
                      controller: _emailTextController,
                      labelText: 'Email',
                      inputType: TextInputType.text,
                    ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                                     CustomTextField(
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return "Please enter a valid password";
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      controller: _passTextController,
                      labelText: 'Password',
                      inputType: TextInputType.visiblePassword,
                
                    ),

                  SizedBox(
                    height: height * 0.04,
                  ),
                                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Please enter a valid  address";
                        } else {
                          return null;
                        }
                      },
                      controller: _phoneTextController,
                      labelText: 'Shipping address',
                      inputType: TextInputType.visiblePassword,

                    ),

                  SizedBox(
                    height: height * 0.06,
                  ),
                   MyButton(
                    color: kcolor7,
                    title: 'Sign Up',
                       onPressed: ()  {
                      _submitFormOnRegister();
 },
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 18,
                            color: kcolor6,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: const Text(
                            "Log in ",
                            style: TextStyle(
                              fontSize: 18,
                              color: kColor3,
                            ),
                          ),
                        )
                      ],
                    ),
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
