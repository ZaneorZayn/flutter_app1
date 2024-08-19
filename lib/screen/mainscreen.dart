import 'package:flutter/material.dart';
import 'package:mobile_app/screen/ProfileScreen.dart';
import 'package:mobile_app/screen/SearchScreen.dart';

import 'package:mobile_app/screen/homescreen.dart';
import 'package:mobile_app/widget/bottomnavigation.dart';
import 'package:provider/provider.dart';

import '../controller/provider/bottom_navigation.dart';


class MainScreen extends StatelessWidget {
  //const MainPage({super.key});

  final List<Widget> _pages = [
    const HomeScreen(),
    const Searchscreen(),
    const Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavigationbarProvider>(
        builder: (context,provider,child){
          return _pages[provider.currentIndex];
        },
      ),

      bottomNavigationBar: const BottomNavigationBarExample(),
    );
  }
}
