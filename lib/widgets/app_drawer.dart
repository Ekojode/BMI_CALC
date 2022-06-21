import 'package:bmi_calculator/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawe extends StatelessWidget {
  const AppDrawe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userMail = Provider.of<UserMail>(context);
    final userEmail = userMail.user;
    return Drawer(
      //  backgroundColor: accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Atiku"),
            accountEmail: Text(userEmail[0].userEmail),
          ),
          DrawerHeader(
              child: Column(
            children: [
              CircleAvatar(
                //radius: 20,
                child: FittedBox(
                  child: Text(
                    userEmail[0].userEmail[0].toUpperCase(),
                  ),
                ),
              ),
              Text(
                userEmail[0].userEmail,
                // style: const TextStyle(color: whiteColor),
              ),
            ],
          )),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
            title: const Text("Log Out"),
            trailing: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
