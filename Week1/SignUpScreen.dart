import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obsecureText = true;
  final TextEditingController _dobController = TextEditingController();

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

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
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Text("Create new Account", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "NAME",
                                border: OutlineInputBorder()
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "EMAIL",
                                border: OutlineInputBorder()
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                              obscureText: _obsecureText,
                              decoration: InputDecoration(
                                labelText: "PASSWORD",
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _obsecureText = !_obsecureText;
                                    });
                                  },
                                  icon: _obsecureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                                ),
                              ),
                            ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: _dobController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "DATE OF BIRTH",
                              suffixIcon: Icon(Icons.calendar_month),
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2000),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now()
                              );

                              if(pickedDate != null){
                                String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                setState(() {
                                  _dobController.text = formattedDate;
                                });
                              }
                            },
                          ),
                          SizedBox(height: 30,),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(child: Text("Sign up", style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                          )
                        ],
                      ),
                    )
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
