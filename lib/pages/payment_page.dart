import 'package:event_planner/pages/home_page.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Total Amount"),
            const Text("40000 Rs"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Pay')),
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/747/747470.png",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
