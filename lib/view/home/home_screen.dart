import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/view/home/car_selection_page.dart';
import 'package:flutter_carwash/view/home/location_selection.dart';
import 'package:flutter_carwash/view/home/payment_screen.dart';
import 'package:flutter_carwash/view/home/service_selection.dart';
import 'package:flutter_carwash/view/home/station_selection.dart';
import 'package:flutter_carwash/widgets/custom_button.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 5;

    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    selectedPage = page;
                  });
                },
                children: const [
                  CarSelectionPage(),
                  LocationPage(),
                  StationSelectionPage(),
                  ServicesSelectionScreen(),
                  PaymentPage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PageViewDotIndicator(
                currentItem: selectedPage,
                count: pageCount,
                unselectedColor: Colors.black26,
                selectedColor: AppAssets.primaryColor,
                duration: const Duration(milliseconds: 200),
                boxShape: BoxShape.circle,
                onItemClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    buttonText: 'Back',
                    onTap: () {
                      _pageController.jumpToPage(selectedPage - 1);
                    },
                  ),
                  CustomTextWidget(
                    text: ('Step: ${(selectedPage + 1)} / $pageCount'),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomButton(
                    buttonText: 'Next',
                    onTap: () {
                      _pageController.jumpToPage(selectedPage + 1);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
