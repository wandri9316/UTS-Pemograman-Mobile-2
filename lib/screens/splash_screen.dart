// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../main.dart'; // Mengarah ke MainScreen (Bottom Nav)

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      if (mounted) {
        // Menggunakan MainScreen dari main.dart
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Implementasi Animasi Lottie
            Lottie.asset(
              'assets/animations/bubles.json',
              width: 500,
              height: 500,
              repeat: true,
            ),
            const SizedBox(height: 20),
            const Text(
              'GALLERY OF ART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            SizedBox(
              width: 280, // Sesuaikan lebar loading bar
              child: LinearProgressIndicator(
                // Jika ingin warna loading bar mengikuti primarySwatch (di main.dart),
                // hapus color dan backgroundColor
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.blueGrey,
                ),
                backgroundColor: Colors.grey[200],
                minHeight: 4, // Ketebalan bar
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
