import 'package:bmi_calculator/providers/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constraints/constants.dart';

class AppDrawe extends StatelessWidget {
  const AppDrawe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userMail = Provider.of<UserMail>(context);
    final userEmail = userMail.user;
    return Drawer(
      //  backgroundColor: accentColor,
      child: Column(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              const CircleAvatar(
                //radius: 20,
                child: FittedBox(child: Text("Rest")),
              ),
              Text(
                userEmail[0].userEmail,
                // style: const TextStyle(color: whiteColor),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
