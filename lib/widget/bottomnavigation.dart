import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/screen/blogscreen.dart';
import 'package:mobile_app/screen/clinicscreen.dart';
import 'package:mobile_app/screen/homescreen.dart';
import 'package:mobile_app/screen/productscreen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onItemTapped; // Callback to handle item tap
  final int selectedIndex; // Current selected index

  const CustomBottomNavigationBar({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/home.svg",
            color: widget.selectedIndex == 0
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/blog.svg",
            color: widget.selectedIndex == 1
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          label: 'Blog',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/clinic.svg",
            color: widget.selectedIndex == 2
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          label: 'Clinic',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/product.svg",
            color: widget.selectedIndex == 3
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          label: 'Products',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      onTap: widget.onItemTapped,
    );
  }
}
