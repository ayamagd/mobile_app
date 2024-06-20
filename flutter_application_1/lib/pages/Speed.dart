import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Home.dart';
import 'package:flutter_application_1/pages/SignUp.dart';
import 'package:flutter_application_1/pages/reuse/my_buttons.dart';
import 'package:flutter_application_1/shared/textfield.dart';

import 'constants.dart';

class Speed extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Speed({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Scaffold(
          
          body: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
               
                  SizedBox(
                    height: height * 0.2,
                  ),
                      CustomTextField(
                      labelText: 'Length',
                      
                      inputType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return 'Please enter a valid value';
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
                      labelText: 'height',
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return 'Please enter a valid value';
                        }else
                        {
                          return null;
                        }
                      },
                    ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                 MyButton(
                    color: kcolor7,
                    title: 'Speed',
                       onPressed: ()  {
                        
                       if (_globalKey.currentState!.validate()) {
                        //do some thing

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      } else {
                        
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                     
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
