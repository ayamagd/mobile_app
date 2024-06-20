
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/constants.dart';
import 'package:flutter_application_1/pages/mainScreen.dart';

import '../shared/curve_cliper.dart';

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

            ClipPath(
                  clipper: CurveCliper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height/1.5,
                    fit: BoxFit.cover,
                    image: const AssetImage('assets/images/drone.png'),
                    
                  ),
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
          context, MaterialPageRoute(builder: (context) => mainScreen()));
    });
  } 


}
