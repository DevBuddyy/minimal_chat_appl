import 'package:flutter/material.dart';
import 'package:minimal_chat_appl/auth/auth_service.dart';
import 'package:minimal_chat_appl/components/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_sharp))
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
