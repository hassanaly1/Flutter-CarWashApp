import 'package:flutter/material.dart';
import 'package:flutter_carwash/view/home/components/icon_and_text.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

class CustomServiceWidget extends StatelessWidget {
  final String serviceName;
  final double servicePrice;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomServiceWidget({
    super.key,
    required this.serviceName,
    required this.servicePrice,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: context.height * 0.15,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: isSelected
                ? Border.all(color: Colors.black, width: 1.0)
                : Border.all(color: Colors.grey.shade300, width: 1.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/premium.png',
                        height: 30,
                      ),
                      const SizedBox(width: 5.0),
                      CustomTextWidget(
                        text: serviceName,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  const Row(
                    children: [
                      IconAndText(
                        text: 'Exterior Wash',
                      ),
                      IconAndText(
                        text: 'Vacuuming',
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Row(
                    children: [
                      IconAndText(
                        text: 'Tyre Cleaning',
                      ),
                      IconAndText(
                        text: 'Hand Drying',
                      ),
                    ],
                  )
                ],
              ),
              Center(
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: '\$${servicePrice.toString()}',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.orangeAccent,
                    ),
                    const SizedBox(width: 5.0),
                    Icon(isSelected
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_off_rounded)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
