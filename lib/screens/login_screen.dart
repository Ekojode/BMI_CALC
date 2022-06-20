import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final _passwordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.35,
                child: Container(
                  //     color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      //   border: Border.all(width: 2),
                      color: Colors.white),
                  //  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    "https://thumbs.dreamstime.com/b/account-login-password-key-computer-man-near-vector-male-character-design-concept-landing-page-web-poster-banner-184009994.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text("Login"),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: Colors.grey,
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
                            decoration:
                                const InputDecoration(hintText: "Email"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.lock),
                        Expanded(
                          child: TextFormField(
                            obscureText: _isObscure,
                            controller: _passwordControl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a password";
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please enter a valid email!";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    FlutterPwValidator(
                        width: 400,
                        height: 150,
                        minLength: 8,
                        onSuccess: () {
                          // print("MATCHED");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Password is matched")));
                        },
                        uppercaseCharCount: 1,
                        numericCharCount: 1,
                        specialCharCount: 1,
                        controller: _passwordControl)
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
