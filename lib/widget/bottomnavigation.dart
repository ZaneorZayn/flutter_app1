import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../controller/provider/bottom_navigation.dart';

class BottomNavigationBarExample extends StatelessWidget {
  const BottomNavigationBarExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationbarProvider>(
      builder: (context, provider, child) {
        return BottomNavigationBar(
          currentIndex: provider.currentIndex, // Set the current index
          onTap: (index) {
            provider.setIndex(index); // Update the selected index
          },
          selectedItemColor: Theme.of(context).colorScheme.primary, // Active color
          unselectedItemColor: Colors.black, // Inactive color
          backgroundColor: Colors.white, // Background color
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                width: 24, // Icon width
                height: 24,
                color: provider.currentIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black, // Change color based on selection// Icon height
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/clinic.svg',
                width: 24, // Icon width
                height: 24,
                color: provider.currentIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black, // Change color based on selection// Icon height
              ),
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/Calandar.svg',
                width: 24, // Icon width
                height: 24,
                color: provider.currentIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Colors.black, // Change color based on selection// Icon height
              ),
              label: 'Clinic',
            ),
          ],
          type: BottomNavigationBarType.fixed, // Ensure the tabs are fixed
        );
      },
    );
  }
}
