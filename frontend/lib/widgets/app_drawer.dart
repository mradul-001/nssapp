import 'package:flutter/material.dart';
import 'package:nssapp/utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 1, 1, 59),
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            leading: const Icon(
              Icons.notifications,
              size: 25,
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, Routes.notificationRoute);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            leading: const Icon(
              Icons.settings,
              size: 25,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, Routes.profileRoute);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            leading: const Icon(
              Icons.logout,
              size: 25,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
