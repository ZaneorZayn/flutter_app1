import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
