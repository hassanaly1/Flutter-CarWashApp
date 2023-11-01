import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/widgets/custom_button.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';
import 'package:flutter_carwash/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(text: 'Email'),
                      const CustomTextField(
                        hintText: 'Enter your Email',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_rounded,
                      ),
                      const SizedBox(height: 15),
                      CustomTextWidget(text: 'Password'),
                      const CustomTextField(
                        hintText: 'Enter your Password',
                        keyboardType: TextInputType.text,
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: Icons.remove_red_eye_rounded,
                        obscureText: true,
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            // Get.to(const ForgotPasswordScreen(),
                            //     transition: Transition.downToUp);
                          },
                          child: CustomTextWidget(
                            text: 'Forgot Password?',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            textColor: Colors.red,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        buttonText: 'Login',
                        onTap: () {},
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.to(const SignUpScreen(),
                          //     transition: Transition.downToUp);
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextWidget(text: "OR"),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomLoginButton(
                        onTap: () {},
                        buttonText: 'Sign in with Google',
                        imagePath: 'assets/images/google-logo.png',
                        textColor: Colors.black,
                        borderColor: Colors.black87,
                        buttonColor: Colors.transparent,
                      ),
                      CustomLoginButton(
                        onTap: () {},
                        buttonText: 'Sign in with Facebook',
                        imagePath: 'assets/images/facebook-logo.png',
                        textColor: Colors.black,
                        borderColor: Colors.black87,
                        buttonColor: Colors.transparent,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomLoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final double width;
  final String imagePath;
  const CustomLoginButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width = double.infinity,
      this.buttonColor,
      this.textColor,
      this.borderColor,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: buttonColor ?? AppAssets.primaryColor,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: borderColor ?? AppAssets.primaryColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Image.asset(
                    imagePath,
                    height: 24,
                  ),
                ),
                CustomTextWidget(
                  text: buttonText,
                  fontSize: 14,
                  textColor: textColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      imagePath,
                      height: 24,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
