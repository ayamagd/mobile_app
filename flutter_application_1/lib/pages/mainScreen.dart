
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/SignUp.dart';
import 'package:flutter_application_1/pages/constants.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/reuse/my_buttons.dart';

import '../shared/curve_cliper.dart';

class mainScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

   mainScreen({super.key});

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
                const SizedBox(
                      height: 0.0000001,
                    ),
              const Text(textt,
               style: TextStyle(
                 fontSize: 20,
                 fontFamily: fontFamily,
               ),
               ),
             
                    MyButton(
                    color: kcolor7,
                    title: 'Login',
                       onPressed: ()  {
                        
                       if (_globalKey.currentState!.validate()) {
                        //do some thing

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Login()));
                      } else {
                        print('please fill this data !');
                      }
                    },
                  ),


                  MyButton(
                    color: kcolor6,
                    title: 'Sign Up',
                       onPressed: ()  {
                        
                       if (_globalKey.currentState!.validate()) {
                        //do some thing

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  SignUp()));
                      } else {
                        print('please fill this data !');
                      }
                    },
                  ),  
             const SizedBox(
                    height: 45,
                  ),
        
        
            ],
          ),
        ),
      ),
      

    );
  }
}






//////////////////////////////////////


/*import 'package:drone_based_crop_monitoring/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:drone_based_crop_monitoring/shared/curve_cliper.dart';
import 'package:drone_based_crop_monitoring/pages/reuse/my_buttons.dart';
import 'package:drone_based_crop_monitoring/pages/reuse/assets.dart';

class SplashScreen extends  StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: Material(
            color: Colors.grey[200],
            child: Column(
              children: [
                ClipPath(
                  clipper: CurveCliper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height/1.5,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/drone.png'),
                    
                  ),
                ),
                ],
             
    
                
            ),
            
          ),
        ),
      ),
    );
  }
}*/



//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

/*//import 'package:drone_based_crop_monitoring/pages/Home.dart';
//import 'package:drone_based_crop_monitoring/pages/SignUp.dart';
//import 'package:drone_based_crop_monitoring/pages/login.dart';
import 'package:drone_based_crop_monitoring/pages/constants.dart';
import 'package:drone_based_crop_monitoring/pages/login.dart';
import 'package:drone_based_crop_monitoring/pages/reuse/assets.dart';
import 'package:flutter/material.dart';

//import 'Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override

  void initState() {
    navigateToHome();
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    
    super.dispose();
    animationController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsData.drone,
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 9,
            ),
            AnimatedBuilder(
                animation: slidingAnimation,
                builder: (context, _) {
                  return SlideTransition(
                    position: slidingAnimation,
                    child: const Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 20,
                      ),
                    ),
                  );
                }),
                ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }


  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  } 


}*/
