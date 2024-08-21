import 'package:flutter/material.dart';
import 'package:mobile_app/core/gradient_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool automaticallyImplyLeading;
  final String? logoPath; // Path to the SVG logo file
  final Gradient? gradientBackground; // Add this for gradient
  final double height; // Add this to allow custom height

  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.titleColor,
    this.automaticallyImplyLeading = true,
    this.logoPath, // Pass the logo path
    this.gradientBackground, // Add this for gradient
    this.height = kToolbarHeight, // Default to standard AppBar height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // Set the height of the container
      decoration: BoxDecoration(
        gradient: Theme.of(context).customGradient, // Use gradient here
      ),
      child: AppBar(
        title: Row(
          children: [
            if (logoPath != null) ...[
              Image.asset(
                logoPath!,
                height: 40.0,
                // Adjust the height as needed
                //color: titleColor ?? Colors.white, // Optionally color the logo
              ),
              SizedBox(width: 8.0), // Add some spacing between logo and title

              if (title != null)
                Text(
                  title!,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: titleColor ?? Colors.white,
                  ),
                ),
            ],
            ],
        ),
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent, // Make AppBar background transparent
        elevation: 1, // Remove AppBar shadow if needed
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height); // Return custom height
}
