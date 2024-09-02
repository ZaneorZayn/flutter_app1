import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    this.containerHeight = 100,
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
    // Get the screen width and height for slight adjustments
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: containerWidth, // Keep width static
      height: containerHeight, // Keep height static
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
            height: containerHeight - 45, // Adjust based on text container height
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
                width: svgWidth, // Keep SVG width static
                height: svgHeight, // Keep SVG height static
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
                    fontSize: textFontSize, // Static font size
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
