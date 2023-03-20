import 'package:fire_base_login/src/widgets/login_button.dart';
import 'package:fire_base_login/src/widgets/square_tile.dart';
import 'package:fire_base_login/src/widgets/users_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///textediting_controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  ///sign_in_user_method
  void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///logo
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.account_circle,
              size: 100,
            ),

            ///welcome_text
            Text(
              'Welcome',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),

            ///user
            UsersText(
              hintText: 'UserName',
              obscureText: false,
              controller: usernameController,
            ),
            SizedBox(
              height: 50,
            ),

            ///password
            UsersText(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),

            ///forget_password
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('Forget Password ?'),
                ],
              ),
            ),

            ///signin_button
            LoginButton(
              onTap: signUserIn,
            ),
            SizedBox(
              height: 50,
            ),

            ///or_continue_with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 52.0),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or sign in with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///google_button
                SquareTIle(imagepath: 'assets/images/google.png'),
SizedBox(width: 25,),
                ///apple_button
                SquareTIle(imagepath: 'assets/images/apple.png')
              ],
            ),
            SizedBox(height: 50,),
            ///not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('not a member?'),
                SizedBox(width: 5,),
                Text('Registernow',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    ));
  }
}
