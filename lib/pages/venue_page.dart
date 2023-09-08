import 'package:event_planner/pages/food_page.dart';
import 'package:flutter/material.dart';

class Venuepage extends StatefulWidget {
  const Venuepage({super.key});

  @override
  State<Venuepage> createState() => _VenuepageState();
}

class _VenuepageState extends State<Venuepage> {
  final List imgList = [
    'assets/slider1.jpg',
    'assets/login.png',
    'assets/registration.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Venue page'),
        ),
        body: Column(
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
            Expanded(
              child: GridView.builder(
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(imgList[index]),
                          const Icon(
                            Icons.favorite_border_outlined,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Foodpage()),
                  );
                },
                child: const Text('Next')),
          ],
        )

        // Center(
        //   child: Column(
        //     children: [
        //       const Text(
        //         'Select the venue your want for your Event',
        //         style: TextStyle(
        //             color: Colors.black45,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20),
        //         textAlign: TextAlign.center,
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
