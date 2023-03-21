import 'package:fire_base_login/src/widgets/login_button.dart';
import 'package:fire_base_login/src/widgets/square_tile.dart';
import 'package:fire_base_login/src/widgets/users_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ///textediting_controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  ///sign_Up_user_method
  void signUserUp() async {
    ///show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        );

    ///try sign iin
    try {
     //check if password is confirmed
      if(passwordController.text == confirmpasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }else{
        //show error Mesage
        showErrorMessage("password didnt match!");
      }

      ///pop the loading Circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ///pop the loading Circle
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///logo
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.account_circle,
                size: 50,
              ),

              ///welcome_text
              Text(
                'Create Account',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 25,
              ),

              ///user
              UsersText(
                hintText: 'UserName',
                obscureText: false,
                controller: emailController,
              ),
              SizedBox(
                height: 20,
              ),

              ///password
              UsersText(
                hintText: 'Password',
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              ///confirm password
              UsersText(
                hintText: ' Confirm Password',
                obscureText: true,
                controller: confirmpasswordController,
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
              LoginButton(text: "SignUp",

                onTap: signUserUp,
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
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///google_button
                  SquareTIle(imagepath: 'assets/images/google.png'),
                  SizedBox(
                    width: 25,
                  ),

                  ///apple_button
                  SquareTIle(imagepath: 'assets/images/apple.png')
                ],
              ),
              SizedBox(
                height: 50,
              ),

              ///not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
