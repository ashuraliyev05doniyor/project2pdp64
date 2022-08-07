import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project2pdp64/pages/home_page.dart';
import 'package:project2pdp64/pages/signup_page.dart';

class SignIn extends StatefulWidget {
  static final String id = "signin_page";

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final usernameController=TextEditingController();
  final passwordController=TextEditingController();

  void _doLogin(){
    String username=usernameController.text.toString().trim();
    String password=passwordController.text.toString().trim();

    var box =Hive.box('database');
    box.put('username', username);
    box.put('password', password);

    String user_id=box.get('username');
    String user_pw=box.get("password");
    print(user_id);
    print(user_pw);
    
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  _callSignUpPage() {
    Navigator.pushNamed(context, SignUp.id);
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
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/item_1.jpg'),
                      fit: BoxFit.cover)),
            ),
            //SizedBox(height: 40),
            Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            //SizedBox(height: 10),
            Text("Sign in to continue", style: TextStyle(color: Colors.white)),
            SizedBox(height: 30),
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
            SizedBox(height: 10),
            Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 50),
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
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _callSignUpPage,
                  child: Text(
                    "Sign Up",
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
