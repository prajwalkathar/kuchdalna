import 'package:event_planner/pages/decoration_page.dart';
import 'package:flutter/material.dart';

class Foodpage extends StatefulWidget {
  const Foodpage({super.key});

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Food page'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
        Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Decorationpage()),
                      );
        }, child:const Text('Next')),
      ),
    );
  }
}