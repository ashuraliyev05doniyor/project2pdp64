import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project2pdp64/pages/signin_page.dart';

import 'home_page.dart';

class SignUp extends StatefulWidget {
  static final String id="signup_page";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final usernameController=TextEditingController();
  final emailController=TextEditingController();
  final numberController=TextEditingController();
  final passwordController=TextEditingController();



  void _doLogin(){
    String username=usernameController.text.toString().trim();
    String email=emailController.text.toString().trim();
    String number=numberController.text.toString().trim();
    String password=passwordController.text.toString().trim();

    var box =Hive.box('database');
    box.put('username', username);
    box.put('email', email);
    box.put('number', number);
    box.put('password', password);

    String user_id=box.get('username');
    String user_email=box.get("email");
    String user_num=box.get('number');
    String user_pw=box.get("password");

    print(user_id);
    print(user_email);
    print(user_num);
    print(user_pw);

    Navigator.pushReplacementNamed(context, HomePage.id);

  }

  _callSignInPage(){
    Navigator.pushNamed(context, SignIn.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 28, 55, 1),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 150),
            Column(
              children: [
                Text(
                  "Create",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Account",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),

            SizedBox(height: 50),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "User Name",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.person_outline, color: Colors.white)),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "E-Mail",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.email_outlined, color: Colors.white)),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: numberController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.phone_outlined, color: Colors.white)),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.brush_sharp, color: Colors.white)),
                  ),

                ],
              ),
            ),

            SizedBox(height: 30),
            FlatButton(
              onPressed: _doLogin,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blue.shade700,
                        Colors.blue.shade600,
                        Colors.blue.shade500,
                        Colors.blue.shade400,
                        Colors.blue.shade300,
                        Colors.blue.shade200,
                        Colors.blue.shade100,
                      ]),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _callSignInPage,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(height: 40)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
