import 'package:flutter/material.dart';
import 'package:novi_test/provider/patient.provider.dart';
import 'package:novi_test/screens/patients_lists/patient_details.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'provider/patient_date_time.provider.dart';
import 'provider/patient_payment.provider.dart';
import 'provider/patient_treatment.provider.dart';
import 'screens/login/login_page.dart';
import 'screens/register/patient_register.dart'; // Required for Future.delayed()

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          // home: const SplashScreen(),
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const LoginPage(),
            '/home': (context) => const PatientsLists(),
            '/register': (context) => const RegisterPage(),
          },
        );
      },
      providers: [
        // Add providers here
        ChangeNotifierProvider(create: (_) => PatientProvider()),
        ChangeNotifierProvider(create: (_) => PatientTreatCountProvider()),
        ChangeNotifierProvider(create: (_) => PaymentState()),
        ChangeNotifierProvider(create: (_) => TreatmentDateTimeProvider()),
      ],
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 5 seconds then navigate to the LoginScreen
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/image/background.png', // Make sure this matches the path in pubspec.yaml
            fit: BoxFit.cover,
          ),
          // Overlay content (optional)
          Center(
            child: Icon(
              Icons.local_florist, // Replace with your desired icon or widget
              size: 100,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}

// Login Screen Widget
