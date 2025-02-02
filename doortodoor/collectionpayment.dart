import 'package:flutter/material.dart';

class ConfirmPaymentPage extends StatelessWidget {
  const ConfirmPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final totalAmount = arguments['totalAmount'];
    final wasteTypes = arguments['wasteTypes'];
    final date = arguments['date'];
    final time = arguments['time'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32), // Rich green shade
        title: const Text('Confirm Payment', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Waste Types Selected:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...wasteTypes.map<Widget>((waste) => Text('- $waste')).toList(),

            const SizedBox(height: 20),
            Text('Collection Date: ${date.toLocal()}'.split(' ')[0]),
            Text('Collection Time: ${time.format(context)}'),

            const SizedBox(height: 20),
            Text('Total Amount: \$${totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show confirmation dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Payment Successful'),
                    content: const Text('Thank you for scheduling the collection!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close dialog
                          Navigator.of(context).popUntil((route) => route.isFirst); // Navigate back to home
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
