import 'package:flutter/material.dart';

class NearbyResourcesPage extends StatelessWidget {
  const NearbyResourcesPage({super.key});

  final List<Map<String, String>> recyclingPlants = const [
    {
      'name': 'EcoGreen Recycling Plant',
      'address': '123 Green Lane, Eco City',
      'openingTime': '8:00 AM',
      'closingTime': '6:00 PM',
      'workingDays': 'Mon - Sat'
    },
    {
      'name': 'Clean Earth Recycling Center',
      'address': '45 Earth Street, Clean Town',
      'openingTime': '9:00 AM',
      'closingTime': '5:00 PM',
      'workingDays': 'Mon - Fri'
    },
    {
      'name': 'GreenCycle Waste Solutions',
      'address': '78 Cycle Road, GreenVille',
      'openingTime': '7:30 AM',
      'closingTime': '4:30 PM',
      'workingDays': 'Tue - Sun'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF7E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        title: const Text(
          'Nearby Recycling Resources',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recyclingPlants.length,
        itemBuilder: (context, index) {
          final plant = recyclingPlants[index];
          return Card(
            color: const Color(0xFF81C784),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                plant['name']!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Address: ${plant['address']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    'Working Days: ${plant['workingDays']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    'Timings: ${plant['openingTime']} - ${plant['closingTime']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              leading: const Icon(Icons.recycling, color: Colors.white, size: 40),
            ),
          );
        },
      ),
    );
  }
}
