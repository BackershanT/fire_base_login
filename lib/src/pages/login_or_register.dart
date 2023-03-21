
import 'package:fire_base_login/src/pages/login_page.dart';
import 'package:fire_base_login/src/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPages = true;

  void togglePages() {
    setState(() {
      showLoginPages = !showLoginPages;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPages) {
      return LoginPage(onTap: togglePages,
      );
    }
    else {
      return RegisterPage(onTap: togglePages,
      );
    }
  }
}

