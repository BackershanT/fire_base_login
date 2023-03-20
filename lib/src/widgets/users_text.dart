import 'package:flutter/material.dart';

class UsersText extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const UsersText(
      {Key? key,
      this.controller,
      required this.hintText,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        cursorColor: Colors.black,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500]
            ),
            fillColor: Colors.grey.shade200),
      ),
    );
  }
}
