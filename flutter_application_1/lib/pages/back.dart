import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Backwidget extends StatelessWidget {
  const Backwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back,
        color: Colors.black,
      ),

    );
  }
}
