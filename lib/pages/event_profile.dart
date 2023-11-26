import 'package:event_planner/pages/venue_page.dart';
import 'package:event_planner/widgets/TextField.dart';
import 'package:flutter/material.dart';

class Eventprofile extends StatefulWidget {
  final String eventType;
  const Eventprofile({super.key, required this.eventType});

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
                String eventName = eventNameController.text.toString().trim();
                String eventDate = dateController.text.toString().trim();
                String eventGuests = guestsController.text.toString().trim();

                if (eventName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Event Name can not be empty!")));
                  return;
                }

                if (eventDate.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Event Date can not be empty!")));
                  return;
                }

                if (eventGuests.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Event Guests can not be empty!")));
                  return;
                }

                Map<String, dynamic> pagedata = {
                  "eventType": widget.eventType,
                  "eventName": eventName,
                  "date": eventDate,
                  "guestCount": eventGuests,
                };

                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Venuepage(pagedata: pagedata)),
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
