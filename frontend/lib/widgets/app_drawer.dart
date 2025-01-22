import 'package:flutter/material.dart';
import 'package:nssapp/utils/authenticator.dart';
import 'package:nssapp/utils/routes.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final AuthService _authService = AuthService();
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
            child: Text("data"),
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
            onTap: () async {
              await _authService.logout();
              print("Logged out");
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
          ),
        ],
      ),
    );
  }
}
