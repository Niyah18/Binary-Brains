import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF7E1), // Light green background
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32), // Rich green shade
        title: const Text(
          "Logout",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Do you want to log out or change your password?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle the logout logic, then navigate to the login page
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                surfaceTintColor: const Color(0xFF66BB6A), // Green button
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the change password page
                Navigator.pushNamed(context, '/change_password');
              },
              style: ElevatedButton.styleFrom(
                surfaceTintColor: const Color(0xFF81C784), // Soft green button
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Change Password",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
