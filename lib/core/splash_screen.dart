import 'package:flutter/material.dart';
import 'package:mobile_app/screen/homescreen.dart';
import 'package:mobile_app/screen/homescreen_content.dart'; // Import your main app

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Duration of splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to your home page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF49EC4), Color(0xFF3CB4E6)], // Define your gradient colors
            begin: Alignment.topCenter, // Start of the gradient
            end: Alignment.bottomCenter, // End of the gradient
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/viya.png', height: 192, width: 190),
              const SizedBox(height: 61),
              Text(
                "VIYACAMBODIA.COM",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
