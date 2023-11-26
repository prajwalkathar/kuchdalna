import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/pages/bill_page.dart';
import 'package:event_planner/pages/payment_page.dart';
import 'package:event_planner/widgets/Grid_Img.dart';
import 'package:flutter/material.dart';

import '../models/venue.dart';

class Decorationpage extends StatefulWidget {
  final IVenue selectedVenue;
  final List selectedList;

  const Decorationpage(
      {super.key, required this.selectedVenue, required this.selectedList});

  @override
  State<Decorationpage> createState() => _DecorationpageState();
}

class _DecorationpageState extends State<Decorationpage> {
  late Future<List> futureVenuesList;

  final CollectionReference _venuesCollectionReference =
      FirebaseFirestore.instance.collection('decoration');

  Future<List> fetchVenues() async {
    try {
      QuerySnapshot snapshot = await _venuesCollectionReference.get();

      return snapshot.docs;
    } catch (error) {
      rethrow;
    }
  }

  @override
  void initState() {
    futureVenuesList = fetchVenues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decoration page'),
      ),
      body: FutureBuilder(
        future: futureVenuesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final venuesList = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select Decoration',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: venuesList!.length,
                    itemExtent: 260,
                    itemBuilder: (context, index) {
                      final decoration = venuesList[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.expand(
                                  child: Image.network(
                                    decoration["image"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (val) {
                                    // for (var item in venuesList) {
                                    // if (item.id == venue.id) {
                                    //   item.isSelected = true;
                                    // } else {
                                    //   item.isSelected = false;
                                    // }
                                    // }
                                    setState(() {});
                                  },
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Price"),
                                              Text(
                                                decoration["price"],
                                              )
                                            ],
                                          ),
                                        ),
                                        Text("Details ->"),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // dynamic selectedVenue = venuesList
                    //     .firstWhere((venue) => venue.isSelected == true);

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
