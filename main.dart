import 'package:flutter/material.dart';
import 'package:greengem/complaintsandfeedback/complaints_feedback.dart';
import 'package:greengem/disposalguidance/disposalguidancepage.dart';
import 'package:greengem/doortodoor/collectionpayment.dart';
import 'package:greengem/doortodoor/doortodoorcollection.dart';
import 'package:greengem/menu/menu_page.dart';
import 'package:greengem/nearbyresources/nearbyresources_pages.dart';
import 'package:greengem/paged/login_page.dart';
import 'package:greengem/themes/theme_provider.dart';
import 'package:greengem/chatbot/chatbot_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: themeProvider.themeData,
      routes: {
        '/menu': (context) => const MenuPage(),
        '/login': (context) => LoginPage(),
        '/door_to_door': (context) => const DoorToDoorCollectionPage(),
        '/confirm_payment': (context) => const ConfirmPaymentPage(),
        '/disposal_guidance': (context) => const DisposalGuidancePage(),
        '/chatbot': (context) => const ChatbotPage(),
        '/nearby_resources': (context) => const NearbyResourcesPage(),
        '/feedback': (context) => const FeedbackPage(),
      },
    );
  }
}
