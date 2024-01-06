import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_appl/pages/settings_page.dart';

import '../auth/auth_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void logout() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                const DrawerHeader(
                  child: Center(
                    child: Icon(
                      CupertinoIcons.chat_bubble_2,
                      size: 35,
                    ),
                  ),
                ),

                //List tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text("H o m e"),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      //drwer pops in
                      Navigator.pop(context);
                    },
                  ),
                ),
                //settings
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                      title: const Text("S e t t i n g s"),
                      //pop in the drawer
                      leading: const Icon(Icons.settings),
                      onTap: () {
                        Navigator.pop(context);
                        //go to settings page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      }),
                ),
              ],
            ),
            //Logout list
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 31),
              child: ListTile(
                title: const Text("L o g o u t"),
                leading: const Icon(Icons.logout),
                onTap: logout,
              ),
            ),
          ],
        ));
  }
}
