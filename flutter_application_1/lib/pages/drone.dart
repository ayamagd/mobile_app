import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Speed.dart';
import 'package:flutter_application_1/pages/constants.dart';
import 'package:flutter_application_1/pages/reuse/my_buttons.dart';
import 'package:flutter_application_1/shared/curve_cliper.dart';

class drone extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

   drone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
           key: _globalKey,
          child: Column(
            
            children: [
              ClipPath(
                  clipper: CurveCliper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height/1.5,
                    fit: BoxFit.cover,
                    image: const AssetImage('assets/images/dd.jpeg'),
                    
                  ),
                ),
                
              const Text(text,
               style: TextStyle(
                 fontSize: 20,
                 fontFamily: fontFamily,
               ),
               ),
                const SizedBox(
                    height: 20,
                  ),
             
                    
                   const SizedBox(
                    height: 20,
                  ),


                  MyButton(
                    color: kcolor7,
                    title: 'Interrupt drone',
                       onPressed: ()  {
          
                    },
                  ),  
             const SizedBox(
                    height: 20,
                  ),
               MyButton(
                    color: kcolor7,
                    title: 'determine path flight',
                       onPressed: ()  {
                        
                       if (_globalKey.currentState!.validate()) {
                        //do some thing

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Speed()));
                      } else {
                        
                      }
                    },
                  ), 
          const SizedBox(
                    height: 30,
                  ),
        
            ],
          ),
        ),
      ),
      

    );
  }
}






