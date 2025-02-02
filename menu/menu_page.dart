import 'package:flutter/material.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF7E1), // Elegant light green background
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32), // Rich green shade
        title: const Text(
          "GreenGem Menu",
          style: TextStyle(color: Colors.white),
        ),
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white),
          onSelected: (value) {
            if (value == 'Profile') {
              Navigator.pushNamed(context, '/profile');
            } else if (value == 'Logout') {
              Navigator.pushNamed(context, '/logout');
            } else if (value == 'Theme') {
              Navigator.pushNamed(context, '/theme');
            } else if (value == 'Features') {
              Navigator.pushNamed(context, '/features');
            }
          },
          itemBuilder: (BuildContext context) => const [
            PopupMenuItem(value: 'Profile', child: Text('Profile')),
            PopupMenuItem(value: 'Logout', child: Text('Logout')),
            PopupMenuItem(value: 'Theme', child: Text('Theme')),
            PopupMenuItem(value: 'Features', child: Text('Features')),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildMenuItem(context, Icons.local_shipping, 'Door-to-Door Collection', '/door_to_door'),
          _buildMenuItem(context, Icons.map, 'Nearby Resources', '/nearby_resources'),
          _buildMenuItem(context, Icons.delete, 'Disposal Guidance', '/disposal_guidance'), // Update this route
          _buildMenuItem(context, Icons.feedback, 'Complaints & Feedback', '/feedback'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF66BB6A), // Elegant green shade
        child: const Icon(Icons.chat, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/chatbot'); // Navigate to Chatbot Page
        },
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF81C784), // Soft green
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
