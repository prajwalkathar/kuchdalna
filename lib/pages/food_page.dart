import 'package:event_planner/models/venue.dart';
import 'package:event_planner/pages/decoration_page.dart';
import 'package:flutter/material.dart';

class Foodpage extends StatefulWidget {
  final IVenue selectedVenue;
  const Foodpage({super.key, required this.selectedVenue});

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.selectedVenue.name!),
            Text(widget.selectedVenue.location!),
            Text(widget.selectedVenue.price!),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Decorationpage()),
                  );
                },
                child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
