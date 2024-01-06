import 'package:flutter/material.dart';
import 'package:minimal_chat_appl/auth/auth_service.dart';
import 'package:minimal_chat_appl/components/app_drawer.dart';
import 'package:minimal_chat_appl/components/user_tile.dart';
import 'package:minimal_chat_appl/pages/chat_page.dart';
import 'package:minimal_chat_appl/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //auth service for chat
  final chatservice _chatService = chatservice();
  final AuthService _authService = AuthService();

  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout_sharp))
        ],
      ),
      drawer: const AppDrawer(),
      body: _buildUserList(),
    );
  }

  //list of users excluding user currently logged in
  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          //for error
          if (snapshot.hasError) {
            return const Text("Error");
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading...");
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: userData["email"],
            ),
          ),
        );
      },
    );
  }
}
