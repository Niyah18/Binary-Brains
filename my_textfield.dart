import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool obscureText;

  const MyTextField({super.key, 
    required this.controller,
    required this.hinttext,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(),
      ),
    );
  }
}
