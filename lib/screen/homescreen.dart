
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/widget/custom_app.dart';
import 'package:mobile_app/widget/gradient_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        //title: 'Home',
        height: 100 ,
        logoPath: 'assets/images/logo.png', // Path to your SVG logo
        actions: [
          IconButton(
            splashColor: Colors.red,

            icon: Icon(Icons.notifications_none),
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            onPressed: () {
              // Handle notifications icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings icon press
            },
          ),
        ],
        backgroundColor: Colors.blue, // Customize the background color
        titleColor: Colors.white, // Customize the title color
      ),
    );
  }
}