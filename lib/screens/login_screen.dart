import 'package:bmi_calculator/Screens/home_screen.dart';
import 'package:bmi_calculator/constraints/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/user_providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final _passwordControl = TextEditingController();
  final _emailControl = TextEditingController();
  var userMale = User(userEmail: 'gg');

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserMail>(context);
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;

    return Scaffold(
      //backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: mainolor,
        //  title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: screenHeight * 0.24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                        "https://thumbs.dreamstime.com/b/account-login-password-key-computer-man-near-vector-male-character-design-concept-landing-page-web-poster-banner-184009994.jpg"),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                "Log in",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: whiteColor),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: whiteColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: cardColor,
                      ),
                      child: const Icon(
                        FontAwesomeIcons.google,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: whiteColor,
                        ),
                        color: cardColor,
                      ),
                      child: const Icon(
                        FontAwesomeIcons.apple,
                        color: whiteColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: whiteColor,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is reqired!";
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please enter a valid email!";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userMale.userEmail = value!;
                              userMale.userEmail = _emailControl.text;
                            },
                            controller: _emailControl,
                            style: const TextStyle(color: whiteColor),
                            decoration: const InputDecoration(
                              hintText: "Email",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    const Text(
                      "Password",
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      children: [
                        const Icon(
                          Icons.lock,
                          color: whiteColor,
                        ),
                        Expanded(
                          child: TextFormField(
                            obscureText: _isObscure,
                            controller: _passwordControl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a password";
                              }
                              if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid password!";
                              }
                              return null;
                            },
                            style: const TextStyle(color: whiteColor),
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)),
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    FlutterPwValidator(
                        width: 400,
                        height: screenHeight * 0.22,
                        minLength: 8,
                        onSuccess: () {},
                        uppercaseCharCount: 1,
                        numericCharCount: 1,
                        specialCharCount: 1,
                        controller: _passwordControl)
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                    user.newUser(userMale);
                  }
                },
                child: Container(
                  height: screenHeight * 0.085,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: accentColor),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
