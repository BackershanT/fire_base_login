import 'package:flutter/material.dart';

class SquareTIle extends StatelessWidget {
  final String imagepath;
  const SquareTIle({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Image.asset(
        imagepath,
        height: 40,
        width: 40,
      ),
    );
  }
}
