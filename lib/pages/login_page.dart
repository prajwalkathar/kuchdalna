import 'package:event_planner/pages/home_page.dart';
import 'package:event_planner/pages/registration_page.dart';
import 'package:event_planner/widgets/TextFieldDecoration.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  void onSubmit(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("email can not be empty!"),
        ),
      );
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("password can not be empty!"),
        ),
      );
    }

    // login operation
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/login.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(children: [
                SizedBox(
                  height: height / 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome\nEvent Planner",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter your email",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  decoration: textFieldDecoration(),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter your password",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: passwordController,
                  decoration: textFieldDecoration(),
                ),
                SizedBox(
                  height: 1,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "forget password",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () => onSubmit(context), child: Text("Login")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const RegistrationPage()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Text(
                    "home page",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
