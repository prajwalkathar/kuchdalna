import 'package:event_planner/pages/login_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List imgList = [
    {"id": 1, "image_path": 'assets/slider1.jpg'},
    {"id": 2, "image_path": 'assets/login.png'},
    {"id": 3, "image_path": 'assets/registration.png'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                  
                    },
                    child: ,
                  )
                ],
              )
            ],
          ),
          
          
          
          
            child: Center(
            child: ListView(
              children: [
                Text(FirebaseAuth.instance.currentUser.toString()),
                ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("Sign Out"),
                )
              ],
            ),
            ),
          ),
      ),
    );
  }

  carousel({required List Image}) {}
}
