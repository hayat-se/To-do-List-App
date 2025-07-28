import 'package:flutter/material.dart';
import 'package:summers_learning_1/Week1/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image(image: AssetImage("assets/logo.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Text("Login", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Sign in to continue", style: TextStyle(fontSize: 13,)),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          )
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              )
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:   BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forgot Password? ", style: TextStyle(fontSize: 12),),
                          SizedBox(width: 15,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                            },
                              child: Text("Sign Up", style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.black),))
                        ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
