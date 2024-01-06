import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_appl/auth/auth_service.dart';
import 'package:minimal_chat_appl/components/cool_textfield.dart';
import 'package:minimal_chat_appl/components/login_button.dart';

class LoginPage extends StatelessWidget {
  //controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //goes to registration page after tapping
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();
    //try login
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    }

    //errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Wrong Email or Password"),
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
          //login button
          const SizedBox(height: 25),

          LoginButton(
            text: "Login",
            onTap: () => login(context),
          ),

          const SizedBox(height: 25),

          //Reg now text
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Not yet a member? ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                "Create account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ])
        ])));
  }
}
