import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

class VehicleSelectionScreen extends StatelessWidget {
  const VehicleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.height * 0.2,
            color: AppAssets.primaryColor,
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text:
                        'Select your car type so we can adjust our prices for you.',
                    maxLines: 2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomTextWidget(
                    text: 'Car type',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  Container(
                    height: context.height * 0.1,
                    color: AppAssets.textLightColor,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
