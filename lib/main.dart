import 'package:bmi_calculator/Screens/home_screen.dart';

import 'package:bmi_calculator/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/user_providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appTitle = "BMI Calculator";
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserMail>(create: (_) => UserMail()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appTitle,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff0a0d22),
            //appBarTheme:
          ),
          home: const LoginScreen(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
          }),
    );
  }
}
