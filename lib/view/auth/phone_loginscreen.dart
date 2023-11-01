import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/view/auth/otp_screen.dart';
import 'package:flutter_carwash/widgets/custom_button.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PhoneLoginScreen extends StatefulWidget {
  CountryCode? countryCode;
  PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final countryPicker = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
  );

  @override
  void initState() {
    super.initState();
    widget.countryCode = const CountryCode(
      name: 'USA',
      code: '',
      dialCode: '+17',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.height * 0.2,
            decoration: const BoxDecoration(
                color: AppAssets.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: 'Enter your phone number for verification.',
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                ),
                SizedBox(height: Get.height * 0.02),
                GestureDetector(
                    onTap: () async {
                      widget.countryCode =
                          await countryPicker.showPicker(context: context);
                      if (widget.countryCode != null) {
                        debugPrint(widget.countryCode!.dialCode);
                      }
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 10),
                          height: 50,
                          width: context.width * 0.2,
                          color: Colors.grey.shade200,
                          child: Center(
                            child: CustomTextWidget(
                              text: widget.countryCode?.dialCode ?? "",
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CustomTextWidget(
                          text: '|',
                          textColor: Colors.black,
                          fontSize: 50,
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            color: Colors.grey.shade200,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '123456789',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: Get.height * 0.02),
                CustomButton(
                  buttonText: 'Confirm',
                  onTap: () {
                    Get.to(const OtpScreen(),
                        transition: Transition.rightToLeft);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
