import 'package:event_planner/pages/venue_page.dart';
import 'package:flutter/material.dart';

class Eventprofile extends StatefulWidget {
  const Eventprofile({super.key});

  @override
  State<Eventprofile> createState() => _EventprofileState();
}

class _EventprofileState extends State<Eventprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event profile page'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Venuepage()),
          );
        },
        child: const Text('Next'),
      ),
    );
  }
}
