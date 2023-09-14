import 'package:event_planner/pages/payment_page.dart';
import 'package:flutter/material.dart';

class Billpage extends StatelessWidget {
  const Billpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Bill'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
            child: const Text('Pay')),
      ),
    );
  }
}
