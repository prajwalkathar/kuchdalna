import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/models/venue.dart';
import 'package:event_planner/pages/food_page.dart';
import 'package:event_planner/widgets/Grid_Img.dart';
import 'package:event_planner/widgets/TextFieldDecoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Venuepage extends StatefulWidget {
  const Venuepage({super.key});

  @override
  State<Venuepage> createState() => _VenuepageState();
}

class _VenuepageState extends State<Venuepage> {
  late Future<List<IVenue>> futureVenuesList;

  final CollectionReference _venuesCollectionReference =
      FirebaseFirestore.instance.collection('venues');

  Future<List<IVenue>> fetchVenues() async {
    try {
      QuerySnapshot snapshot = await _venuesCollectionReference.get();

      return snapshot.docs.map((doc) => IVenue.fromFirestore(doc)).toList();
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
        title: const Text('Venue page'),
      ),
      body: FutureBuilder(
        future: futureVenuesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final venuesList = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Select the venue your want for your Event',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(5),
                    itemCount: venuesList!.length,
                    itemExtent: 260,
                    itemBuilder: (context, index) {
                      final venue = venuesList[index];

                      return GridImg(
                        imagePath: venue.images![0],
                        isSeleted: venue.isSelected!,
                        onSelected: (value) {
                          for (var item in venuesList) {
                            if (item.id == venue.id) {
                              item.isSelected = true;
                            } else {
                              item.isSelected = false;
                            }
                          }
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    dynamic selectedVenue = venuesList
                        .firstWhere((venue) => venue.isSelected == true);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => Foodpage(
                                selectedVenue: selectedVenue,
                              )),
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            );
          }
        },
      ),

      // Center(
      //   child: Column(
      //     children: [,
      //       const Text(
      //         'Select the venue your want for your Event',
      //         style: TextStyle(
      //             color: Colors.black45,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20),
      //         textAlign: TextAlign.center,'
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => const Foodpage()),
      //             );
      //           },
      //           child: const Text('Next')),
      //     ],
      //   ),
      // ),
    );
  }
}
