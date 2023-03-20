import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  const LoginButton({Key, required this.onTap,  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8)
        ),

        child: const Text('Login',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
