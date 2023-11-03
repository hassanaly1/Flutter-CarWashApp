import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width,
      this.buttonColor = AppAssets.primaryColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomTextWidget(
              text: buttonText,
              fontSize: 16,
              textColor: textColor ?? Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ))),
    );
  }
}
