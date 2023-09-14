import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_planner/pages/ImageView.dart';
import 'package:event_planner/pages/event_profile.dart';
//import 'package:event_planner/pages/event_profile.dart';
import 'package:event_planner/pages/venue_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List imgList = [
    'assets/slider1.jpg',
    'assets/login.png',
    'assets/registration.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event planner'),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                //  selected: _selectedIndex == 0,
                onTap: () {
                  // Update the state of the app
                  //   _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('My Profile '),
                //   selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  //     _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('My Event '),
                //   selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  //     _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('About Us '),
                //   selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  //     _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('logout'),
                //   selected: _selectedIndex == 2,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed("/login");
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                autoPlayInterval: const Duration(seconds: 4),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: imgList.map((item) {
                return InkWell(
                  onTap: () {
                    print("hello");

                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ImageView(
                          imagePath: item,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child:
                          Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
                alignment: Alignment.center, child: Text('Choose Your Event')),
            const SizedBox(
              height: 20,
            ),

            Container(
              height: 370,
              width: 370,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(70),
              ),
              //  color: Colors.black12,
              child: GridView.count(
                padding: EdgeInsets.all(20),
                crossAxisCount: 2,
                children: [
                  InkWell(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              //    boxShadow: [BoxShadow(color: Colors.black12)],
                              image: DecorationImage(
                                image: AssetImage("assets/wedding.png"),
                              ),
                            ),
                          ),
                          const Text(
                            "Wedding",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Eventprofile()),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/engagement.jpg"),
                              ),
                            ),
                          ),
                          const Text(
                            "Engagement",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Eventprofile()),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/birthday.png"),
                              ),
                            ),
                          ),
                          const Text(
                            "Birthday",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Eventprofile()),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/more.png"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "More",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Eventprofile()),
                      );
                    },
                  ),
                ],
              ),
            ),
            //   Text(FirebaseAuth.instance.currentUser.toString()),
          ],
        ),
      ),
    );
  }
}
