import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/constants.dart';
import 'package:flutter_application_1/pages/drone.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/plant.dart';
import 'package:flutter_application_1/pages/reuse/assets.dart';
import 'package:flutter_application_1/pages/reuse/my_buttons.dart';

import '../shared/curve_cliper.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
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
          
            Column(
              children: [
                 SizedBox(
                    height: 20,
                  ),
            MyButton(
                    color: kcolor7,
                    title: 'Control drone',
                       onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  drone()));
                       
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
            
                SingleChildScrollView(
                  child:  MyButton(
                    color: kcolor7,
                    title: 'Plant',
                       onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Plant()));
                       
                    },
                  ),
                ),
             SizedBox(
                    height: 30,
                  ),
              ],
            ),
            
      //////////////////////////////////////////////
            
            /* Row(
              children: [
                //facebook button
                Image.network(
                  AssetsData.facebok,
                  height: 60,
                  width: 60,
                ),
              const SizedBox(width: 100,
              ),
              //google button
                 Image.network(
                  AssetsData.google,
                  height: 60,
                  width: 60,
                             ),
            
              ],
            )*/
          ],
        ),
      ),
      backgroundColor: kcolor5,
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsData.dd),
                  fit: BoxFit.cover,
                ),
              ),
              accountEmail: Text(
                "",
                style: TextStyle(
                  color: kColor3,
                ),
              ),
              accountName: Text(
                " ",
                style: TextStyle(
                  color: kColor3,
                ),
              ),
            ),
            ListTile(
              title: const Text(' Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            /* ListTile(
              title: const Text(' About'),
              leading: const Icon(Icons.help_center),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Home()));
              },
            ),*/
            ListTile(
              title: const Text(' Log Out'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  Login()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: kcolor7,
        title: const Text('Home'),
      ),
    );
  }
}

class _globalKey {
  static var currentState;
}
