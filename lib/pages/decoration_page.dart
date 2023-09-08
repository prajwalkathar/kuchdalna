import 'package:event_planner/pages/bill_page.dart';
import 'package:flutter/material.dart';

class Decorationpage extends StatelessWidget {
  const Decorationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decoration page'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Billpage()),
                        );
        }, child: const Text('Next')),
      ),
    );
  }
}