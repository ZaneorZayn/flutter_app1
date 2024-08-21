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
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Your period is likely to start on or around 29 August",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
                                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
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
                                  text: "Join the movement ",
                                  //icon: SvgPicture.asset("assets/images/clinic.svg"),
                                  width:90,
                                  height:40 ,
                                ),
                              ),
                              SizedBox(width: 6,),
                              Expanded(
                                child: CustomButton(
                                  text: "Hot Line ",
                                  icon: SvgPicture.asset("assets/images/clinic.svg"),
                                  width:90,
                                  height:40 ,
                                  backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
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
            ),

            const Padding(
              padding:  EdgeInsets.all(12.0),
              child: Column(
                children: [

                  Text("Get Answer",),

                  Row(
                    children: [
                  
                      Expanded(
                        child: SvgTextContainer(
                            svgPath: 'assets/images/medicine.svg',  // Replace with your actual SVG path
                            text: 'Sexual Health',
                            backgroundColor: Colors.blueAccent, // Example customization
                            textColor: Colors.black,
                            textBackgroundColor: Colors.white,
                            textFontSize: 11,
                            textFontWeight: FontWeight.bold,
                                      ),
                      ),
                        SizedBox(width: 8,),
                       Expanded(
                        child: SvgTextContainer(
                            svgPath: 'assets/images/medicine.svg',  // Replace with your actual SVG path
                            text: 'Menstrual Health',
                            backgroundColor: Colors.blueAccent, // Example customization
                            textColor: Colors.black,
                            textBackgroundColor: Colors.white,
                            textFontSize: 11,
                            textFontWeight: FontWeight.bold,
                                      ),
                      ),
                          SizedBox(width: 8,),
                      Expanded(
                        child: SvgTextContainer(
                            svgPath: 'assets/images/medicine.svg',  // Replace with your actual SVG path
                            text: 'Sexual Health',
                            backgroundColor: Colors.blueAccent, // Example customization
                            textColor: Colors.black,
                            textBackgroundColor: Colors.white,
                            textFontSize: 11.0,
                            textFontWeight: FontWeight.bold,
                                      ),
                      ),
                      SizedBox(width: 8,),
                     Expanded(
                        child: SvgTextContainer(
                            svgPath: 'assets/images/medicine.svg',  // Replace with your actual SVG path
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
            )
          ],
        ),
      )
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
                color: Colors.white,
              ),
              textAlign: TextAlign.center,

              overflow: TextOverflow.visible, // Allow text to wrap or show fully
            ),
          ),
        ],
      ),
    );
  }
}

class SvgTextContainer extends StatelessWidget {
  final String svgPath;
  final String text;
  final double containerWidth;
  final double containerHeight;
  final Color backgroundColor;
  final Color textColor;
  final double svgHeight;
  final double svgWidth;
  final Color textBackgroundColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  final double borderRadius;

  const SvgTextContainer({
    Key? key,
    required this.svgPath,
    required this.text,
    this.containerWidth = 90,
    this.containerHeight = 110,
    this.backgroundColor = const Color(0xFFFED3DD),
    this.textColor = Colors.black,
    this.svgHeight = 50,
    this.svgWidth = 90,
    this.textBackgroundColor = const Color(0xFFFCF1FF),
    this.textFontSize = 10.24,
    this.textFontWeight = FontWeight.w400,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: containerHeight - 40, // Adjust based on text container height
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                width: svgWidth,
                height: svgHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40, // Fixed height for the text container
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: ShapeDecoration(
              color: textBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textFontSize,
                    fontWeight: textFontWeight,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2, // Allow up to 2 lines
                  overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
