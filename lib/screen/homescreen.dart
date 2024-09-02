import 'package:flutter/material.dart';
import 'package:mobile_app/screen/blogscreen.dart';
import 'package:mobile_app/screen/clinicscreen.dart';
import 'package:mobile_app/screen/productscreen.dart';


import '../widget/bottomnavigation.dart';
import 'homescreen_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenContent(), // You can replace this with actual Home content widget
    Blogscreen(),
    Clinicscreen(),
    ProductScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// Placeholder for home screen content; you can replace it with your actual content.

