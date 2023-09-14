import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/pages/login_page.dart';
import 'package:event_planner/widgets/TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void onSubmit() async {
    String name = nameController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPass = confirmPasswordController.text.trim();

    // Note: add validation later

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushReplacementNamed('/login');
      print(credential);
      FirebaseFirestore db = FirebaseFirestore.instance;

      final user = <String, String>{
        "name": name,
        "email": email,
        "uid": credential.user!.uid,
      };

      db
          .collection("users")
          .doc(credential.user!.uid)
          .set(user)
          .onError((e, _) => print("Error writing document: $e"));

      //if credential is not empty..
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/registration.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(children: [
                SizedBox(
                  height: height / 7,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Registration",
                    style: TextStyle(fontSize: 31, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                textFieldFunc('Enter Your Name', Colors.white, Icons.person,
                    false, nameController),
                const SizedBox(
                  height: 20,
                ),
                textFieldFunc('Enter Your Email', Colors.white, Icons.email,
                    false, emailController),
                const SizedBox(
                  height: 20,
                ),
                textFieldFunc('Password', Colors.white, Icons.password, false,
                    passwordController),
                const SizedBox(
                  height: 20,
                ),
                textFieldFunc('Confirm Password', Colors.white, Icons.password,
                    false, confirmPasswordController),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
