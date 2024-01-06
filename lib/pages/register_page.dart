import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_appl/auth/auth_service.dart';
import 'package:minimal_chat_appl/components/cool_textfield.dart';
import 'package:minimal_chat_appl/components/login_button.dart';

class RegisterPage extends StatelessWidget {
  //controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //goes to registration page after tapping
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  //reg method
  void register(BuildContext context) {
    //get authentication service
    final _auth = AuthService();

    //to create user when passwords match
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    //error if passwords don't match
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords do not match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //logo
          Icon(
            CupertinoIcons.chat_bubble_2,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 50),
          Text(
            "Welcome!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 25),
          CoolTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          const SizedBox(height: 10),

          CoolTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),

          const SizedBox(height: 10),

          CoolTextField(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _confirmPasswordController,
          ),
          //login button
          const SizedBox(height: 25),

          LoginButton(
            text: "Create account",
            onTap: () => register(context),
          ),

          const SizedBox(height: 25),

          //Reg now text
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Already have an account? ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ])
        ])));
  }
}
