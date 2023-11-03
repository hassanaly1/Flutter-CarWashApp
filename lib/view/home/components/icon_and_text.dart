import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';

class IconAndText extends StatelessWidget {
  final String text;
  const IconAndText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppAssets.primaryColor),
              child: const Icon(
                Icons.done,
                color: Colors.white,
                size: 8,
              )),
          const SizedBox(width: 5.0),
          CustomTextWidget(
            text: text,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }
}
