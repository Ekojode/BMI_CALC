import 'package:flutter/cupertino.dart';

class User {
  String userEmail;

  User({required this.userEmail});
}

class UserMail with ChangeNotifier {
  List<User> user = [];

  void newUser(User mail) {
    user.insert(0, mail);
    notifyListeners();
  }
}
