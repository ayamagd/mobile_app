import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/back.dart';
import 'package:flutter_application_1/pages/constants.dart';
import 'package:flutter_application_1/pages/reuse/reusable.dart';
import 'package:flutter_application_1/pages/utils.dart';
import 'package:flutter_application_1/shared/custombutton.dart';
import 'package:flutter_application_1/widget/textwidget.dart';



class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}
class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailTextController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }
  void forgetPassFCT() async {
    if (emailTextController.text.isEmpty ||
        !emailTextController.text.contains("@")) {
      errorDialog(
          subtitle: 'Please enter a correct email address', context: context);
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        await authInstance.sendPasswordResetEmail(
            email: emailTextController.text.toLowerCase());
   
      } on FirebaseException catch (error) {
        errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  const Backwidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  Textwidget(
                    text: 'Forget password',
                    color: Colors.black,
                    textsize: 30,
                    
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: emailTextController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    buttomName: 'Reset now',
                    onTap: () {
                      forgetPassFCT();
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      
    );
  }

}
