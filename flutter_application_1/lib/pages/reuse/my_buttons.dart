import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(18),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 210,
          height: 50,
          child: Text(
            title,
            style: const TextStyle(
              //color:kColor3,
              fontSize: 20,
      
              ),
          ),
        ),
      ),
    );
  }
}