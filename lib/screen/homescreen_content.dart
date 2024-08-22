import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widget/carousel_slider.dart';
import 'package:mobile_app/widget/custom_app.dart';
import '../model/blog_model.dart';
import '../model/product_model.dart';
import '../widget/blog_cart.dart';
import '../widget/button.dart';
import '../widget/product_widget.dart';
import '../widget/svg_container.dart'; // Import your product model

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          appBar: CustomAppBar(
            height: 120,
            logoPath: 'assets/images/logo.png', // Path to your SVG logo
            actions: [
              IconButton(
                splashColor: Colors.red,
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                ),
                icon: Icon(Icons.notifications_none),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ImageCarousel(),
                ), // slide

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: Container(
                    height: isTablet ? screenHeight * 0.07 : screenHeight * 0.05,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Your period is likely to start on or around 29 August",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: isTablet ? screenWidth * 0.35 : screenWidth * 0.43,
                        height: isTablet ? screenHeight * 0.15 : screenHeight * 0.12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "Doctor \nAppointment",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Image(
                                image: AssetImage(
                                  "assets/images/doctor.png",
                                ),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 48,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: "Check Up",
                                      icon: SvgPicture.asset("assets/images/clinic.svg"),
                                      width: isTablet ? 120 : 90,
                                      height: isTablet ? 50 : 40,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: CustomButton(
                                      text: "Clinic",
                                      icon: SvgPicture.asset("assets/images/clinic.svg"),
                                      width: isTablet ? 120 : 90,
                                      height: isTablet ? 50 : 40,
                                      backgroundColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 14),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: CustomButton(
                                      text: "Join the movement ",
                                      //icon: SvgPicture.asset("assets/images/clinic.svg"),
                                      width: 90,
                                      height: 40,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: CustomButton(
                                      text: "Hot Line ",
                                      icon: SvgPicture.asset("assets/images/clinic.svg"),
                                      width: isTablet ? 120 : 90,
                                      height: isTablet ? 50 : 40,
                                      backgroundColor:
                                      Theme.of(context).colorScheme.onInverseSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1918274B),
                          blurRadius: 32,
                          offset: Offset(0, 10),
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: Color(0x1E18274B),
                          blurRadius: 14,
                          offset: Offset(0, 6),
                          spreadRadius: -6,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Get Answer",
                                style: GoogleFonts.nunito(
                                  fontSize: isTablet ? 14 : 12.8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: SvgTextContainer(
                                svgPath: 'assets/images/prescription.svg', // Replace with your actual SVG path
                                text: 'Sexual Health',
                                backgroundColor: Colors.blueAccent, // Example customization
                                textColor: Colors.black,
                                textBackgroundColor: Colors.white,
                                textFontSize: 11,
                                textFontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: SvgTextContainer(
                                svgPath: 'assets/images/medicine.svg', // Replace with your actual SVG path
                                text: 'Menstrual Health',
                                backgroundColor: Colors.blueAccent, // Example customization
                                textColor: Colors.black,
                                textBackgroundColor: Colors.white,
                                textFontSize: 11,
                                textFontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: SvgTextContainer(
                                svgPath: 'assets/images/Calander.svg', // Replace with your actual SVG path
                                text: 'Sexual Health',
                                backgroundColor: Colors.blueAccent, // Example customization
                                textColor: Colors.black,
                                textBackgroundColor: Colors.white,
                                textFontSize: 11.0,
                                textFontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: SvgTextContainer(
                                svgPath: 'assets/images/clinic.svg', // Replace with your actual SVG path
                                text: 'Pregnancy',
                                backgroundColor: Colors.blueAccent, // Example customization
                                textColor: Colors.black,
                                textBackgroundColor: Colors.white,
                                textFontSize: 11.0,
                                textFontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Blogs",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "View all",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: isTablet ? 300 : 240, // Adjust based on the screen size
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                      itemCount: fakeBlogPosts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: isTablet ? screenWidth * 0.5 : screenWidth * 0.6, // Adjust width for tablets
                          margin: const EdgeInsets.only(right: 8.0), // Add margin between cards
                          child: BlogPostCard(blogPost: fakeBlogPosts[index]),
                        );
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Our Products",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "View all",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )),
                    ],
                  ),
                ),

                // Product List Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: isTablet ? 400 : 280, // Adjust based on the screen size
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                      itemCount: dummyProducts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: isTablet ? screenWidth * 0.5 : screenWidth * 0.6, // Adjust width for tablets
                          margin: const EdgeInsets.only(right: 8.0), // Add margin between cards
                          child: ProductWidget(product: dummyProducts[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Assuming ProductWidget is already implemented as previously describe


