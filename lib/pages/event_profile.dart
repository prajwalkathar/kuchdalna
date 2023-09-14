import 'package:event_planner/pages/venue_page.dart';
import 'package:event_planner/widgets/TextField.dart';
import 'package:flutter/material.dart';

class Eventprofile extends StatefulWidget {
  const Eventprofile({super.key});

  @override
  State<Eventprofile> createState() => _EventprofileState();
}

class _EventprofileState extends State<Eventprofile> {
  TextEditingController eventNameController = TextEditingController(),
      dateController = TextEditingController(),
      guestsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event profile page'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Event Profile",
                style: TextStyle(
                  fontSize: 31,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            textFieldFunc("Name of Event", Colors.black, Icons.event, false,
                eventNameController),
            const SizedBox(
              height: 15,
            ),
            textFieldFunc("Event Date", Colors.black, Icons.date_range, false,
                dateController),
            const SizedBox(
              height: 15,
            ),
            textFieldFunc("Number of Guests", Colors.black, Icons.person_3,
                false, guestsController),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Venuepage()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
