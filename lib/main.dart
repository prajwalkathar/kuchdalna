import 'package:event_planner/firebase_options.dart';
import 'package:event_planner/models/venue.dart';
import 'package:event_planner/pages/food_page.dart';
import 'package:event_planner/pages/home_page.dart';
import 'package:event_planner/pages/login_page.dart';
import 'package:event_planner/pages/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  initialRoute: '/',
      initialRoute:
          FirebaseAuth.instance.currentUser != null ? "/food" : "/login",
      routes: {
        "/": (context) => const HomePage(),
        "/food": (context) => Foodpage(
              selectedVenue:
                  IVenue(capacity: "20", isSelected: true, price: "2000"),
            ),
        "/login": (context) => const LoginPage(),
        "/registration": (context) => const RegistrationPage(),
      },
    );
  }
}
