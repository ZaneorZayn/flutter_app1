import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/widget/carousel_slider.dart';
import 'package:mobile_app/widget/custom_app.dart';

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ImageCarousel(),
            ),// slide

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
              child: Container(
                height: screenHeight * 0.05,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Your period is likely on 29 August",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: screenWidth * 0.43,
                    height: screenHeight * 0.12,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text("Doctor \nAppointment",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4,),

                          Image(image:AssetImage("assets/images/doctor.png",
                          ),
                            fit: BoxFit.cover,
                            height: 100,
                            width: 48,
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 4),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    text: "Check Up",
                                    icon: SvgPicture.asset("assets/images/clinic.svg"),
                                    width: 900,
                                    height:40 ,
                                ),
                              ),
                                  SizedBox(width: 5,),
                              Expanded(
                                child: CustomButton(
                                  text: "Clinic",
                                  icon: SvgPicture.asset("assets/images/clinic.svg"),
                                  width:90,
                                  height:40 ,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 14),
                          child: Row(
                            children: [

                              Expanded(
                                child: CustomButton(
                                  text: "Join us ",
                                  icon: SvgPicture.asset("assets/images/clinic.svg"),
                                  width:90,
                                  height:40 ,
                                ),
                              ),
                              SizedBox(width: 6,),
                              Expanded(
                                child: CustomButton(
                                  text: "Join us ",
                                  icon: SvgPicture.asset("assets/images/clinic.svg"),
                                  width:90,
                                  height:40 ,
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class IconTextButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  final Color iconColor;
  final Color textColor;
  final Color backgroundColor;

  const IconTextButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensures the button takes up only the necessary space
        children: [
         icon,
          SizedBox(width: 8.0), // Space between icon and text
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onError,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final Widget? icon;

  const CustomButton({
    Key? key,
    required this.text,
    this.backgroundColor = const Color(0xFFF9C0C7),
    this.textColor = const Color(0xFF59315E),
    this.width,
    this.height = 45,
    this.fontSize = 12.8,
    this.fontWeight = FontWeight.w900,
    this.borderRadius = 10.0,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Width can be dynamic or fixed
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            SizedBox(width: 4), // Space between icon and text
          ],
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),

              overflow: TextOverflow.visible, // Allow text to wrap or show fully
            ),
          ),
        ],
      ),
    );
  }
}
