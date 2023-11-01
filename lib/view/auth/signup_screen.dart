// // import 'package:flutter/material.dart';
// // import 'package:flutter_carwash/utilities/constants.dart';
// // import 'package:flutter_carwash/view/auth/login_screen.dart';
// // import 'package:flutter_carwash/widgets/custom_button.dart';
// // import 'package:flutter_carwash/widgets/custom_text_widget.dart';
// // import 'package:flutter_carwash/widgets/custom_textfield.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class SignUpScreen extends StatelessWidget {
// //   const SignUpScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Container(
// //               height: context.height * 0.2,
// //               decoration: const BoxDecoration(
// //                   color: AppAssets.primaryColor,
// //                   borderRadius: BorderRadius.only(
// //                     bottomLeft: Radius.circular(20.0),
// //                     bottomRight: Radius.circular(20.0),
// //                   )),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(20.0),
// //               child: Column(
// //                 children: [
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       CustomTextWidget(text: 'Full Name'),
// //                       const CustomTextField(
// //                         hintText: 'Enter your Full Name',
// //                         keyboardType: TextInputType.emailAddress,
// //                         prefixIcon: Icons.person_2_rounded,
// //                       ),
// //                       const SizedBox(height: 15),
// //                       CustomTextWidget(text: 'Email'),
// //                       const CustomTextField(
// //                         hintText: 'Enter your Email',
// //                         keyboardType: TextInputType.text,
// //                         obscureText: true,
// //                         prefixIcon: Icons.email_rounded,
// //                       ),
// //                       const SizedBox(height: 15),
// //                       CustomTextWidget(text: 'Password'),
// //                       const CustomTextField(
// //                         hintText: 'Enter your Password',
// //                         keyboardType: TextInputType.emailAddress,
// //                         prefixIcon: Icons.lock_outline_rounded,
// //                         suffixIcon: Icons.remove_red_eye_rounded,
// //                       ),
// //                       const SizedBox(height: 15),
// //                       CustomTextWidget(text: 'Confirm Password'),
// //                       const CustomTextField(
// //                         hintText: 'Enter your Confirm Password',
// //                         keyboardType: TextInputType.text,
// //                         prefixIcon: Icons.lock_outline_rounded,
// //                         suffixIcon: Icons.remove_red_eye_rounded,
// //                         obscureText: true,
// //                       ),
// //                       const SizedBox(height: 15),
// //                       const SizedBox(height: 25),
// //                       CustomButton(
// //                         buttonText: 'Create Account',
// //                         onTap: () {},
// //                       )
// //                     ],
// //                   ),
// //                   const SizedBox(height: 15),
// //                   Column(
// //                     children: [
// //                       InkWell(
// //                         onTap: () {
// //                           Get.to(const LoginScreen(),
// //                               transition: Transition.downToUp);
// //                         },
// //                         child: RichText(
// //                           textAlign: TextAlign.center,
// //                           text: TextSpan(
// //                             text: "Already have an account? ",
// //                             style: GoogleFonts.poppins(
// //                               color: Colors.black,
// //                               fontSize: 14,
// //                               fontWeight: FontWeight.w300,
// //                             ),
// //                             children: [
// //                               TextSpan(
// //                                 text: 'Login',
// //                                 style: GoogleFonts.poppins(
// //                                     fontSize: 14,
// //                                     fontWeight: FontWeight.w300,
// //                                     color: Colors.red),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   )
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class CustomLoginButton extends StatelessWidget {
// //   final String buttonText;
// //   final VoidCallback onTap;
// //   final Color? buttonColor;
// //   final Color? textColor;
// //   final Color? borderColor;
// //   final double width;
// //   final String imagePath;
// //   const CustomLoginButton(
// //       {super.key,
// //       required this.buttonText,
// //       required this.onTap,
// //       this.width = double.infinity,
// //       this.buttonColor,
// //       this.textColor,
// //       this.borderColor,
// //       required this.imagePath});

// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: onTap,
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 12.0),
// //         child: Container(
// //             height: 50,
// //             width: width,
// //             decoration: BoxDecoration(
// //                 color: buttonColor ?? AppAssets.primaryColor,
// //                 borderRadius: BorderRadius.circular(12),
// //                 border:
// //                     Border.all(color: borderColor ?? AppAssets.primaryColor)),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.only(left: 15),
// //                   child: Image.asset(
// //                     imagePath,
// //                     height: 24,
// //                   ),
// //                 ),
// //                 CustomTextWidget(
// //                   text: buttonText,
// //                   fontSize: 14,
// //                   textColor: textColor ?? Colors.white,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //                 Visibility(
// //                   visible: false,
// //                   child: Padding(
// //                     padding: const EdgeInsets.only(left: 15),
// //                     child: Image.asset(
// //                       imagePath,
// //                       height: 24,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             )),
// //       ),
// //     );
// //   }
// // }

// import 'package:fl_country_code_picker/fl_country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medical_app/screens/doctor/auth/auth/doctor_otp_screen.dart';
// import 'package:medical_app/widgets/custom_appbar.dart';
// import 'package:medical_app/widgets/custom_button.dart';
// import 'package:medical_app/widgets/custom_text_widget.dart';

// class DoctorVerifyNumberScreen extends StatefulWidget {
//   CountryCode? countryCode;
//   DoctorVerifyNumberScreen({super.key});

//   @override
//   State<DoctorVerifyNumberScreen> createState() =>
//       _DoctorVerifyNumberScreenState();
// }

// class _DoctorVerifyNumberScreenState extends State<DoctorVerifyNumberScreen> {
//   final countryPicker = const FlCountryCodePicker(
//     localize: true,
//     showDialCode: true,
//     showSearchBar: true,
//   );

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     widget.countryCode = const CountryCode(
//       name: 'USA',
//       code: '',
//       dialCode: '',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DoctorCustomAppBarWidget(title: 'Verify your phone number'),
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const DoctorCustomTextWidget(
//               text:
//                   'We have sent you an SMS with a code to number +17 0123456789.',
//               textAlign: TextAlign.center,
//               fontSize: 20,
//               fontWeight: FontWeight.w400,
//             ),
//             SizedBox(height: Get.height * 0.02),
//             GestureDetector(
//               onTap: () async {
//                 widget.countryCode =
//                     await countryPicker.showPicker(context: context);
//                 if (widget.countryCode != null) {
//                   debugPrint(widget.countryCode!.dialCode);
//                 }
//                 setState(() {});
//               },
//               child: Row(
//                 children: [
//                   Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 13, horizontal: 10),
//                       height: 50,
//                       width: 80,
//                       color: Colors.grey.shade200,
//                       child: Center(
//                         child: CustomTextWidget(
//                           // ignore: dead_code
//                           text: widget.countryCode?.dialCode ?? "",
//                           fontSize: 22,
//                         ),
//                       )),
//                   const CustomTextWidget(
//                     text: '|',
//                     textColor: Colors.black,
//                     fontSize: 50,
//                   ),
//                   Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 13, horizontal: 10),
//                       height: 50,
//                       width: Get.width * 0.65,
//                       color: Colors.grey.shade200,
//                       child: const CustomTextWidget(
//                         text: '123456+789',
//                         textAlign: TextAlign.start,
//                         fontSize: 22,
//                       )),
//                 ],
//               ),
//             ),
//             SizedBox(height: Get.height * 0.02),
//             DoctorCustomButton(
//               buttonText: 'Confirm',
//               onTap: () {
//                 Get.to(const DoctorOtpScreen(),
//                     transition: Transition.rightToLeft);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
