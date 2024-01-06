import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_appl/pages/settings_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
                DrawerHeader(
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
                    title: Text("H o m e"),
                    leading: Icon(Icons.home),
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
                      title: Text("S e t t i n g s"),
                      //pop in the drawer
                      leading: Icon(Icons.settings),
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
                title: Text("L o  g o u t"),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ));
  }
}
