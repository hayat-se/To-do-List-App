import 'package:flutter/material.dart';
import 'package:summers_learning_1/Week1/HomeScreen.dart';
import 'package:summers_learning_1/Week1/SignUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade900),
          ),
          Positioned(
            top: 120,
            left: 140,
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Sign in to continue", style: TextStyle(fontSize: 13)),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter email";
                                } else if (!value.contains("@")) {
                                  return "Please enter valid email";
                                } else {
                                  return null;
                                }
                              },
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                } else if (value.length < 6) {
                                  return "Password must be atleast 6 letters";
                                } else {
                                  return null;
                                }
                              },
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  getLogin();
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot Password? ",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getLogin() async {
    SharedPreferences db = await SharedPreferences.getInstance();

    if (_emailController.text == db.getString("email") &&
        _passwordController.text == db.getString("password")) {
      db.setBool("isLoggedIn", true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Successful !!"),
          duration: Duration(seconds: 1),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email not found Failed !"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
