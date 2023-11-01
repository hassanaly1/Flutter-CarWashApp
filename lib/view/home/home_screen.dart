import 'package:flutter/material.dart';
import 'package:flutter_carwash/utilities/constants.dart';
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
                  ServicesPage(),
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
            SizedBox(
              height: context.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

class CarSelectionPage extends StatelessWidget {
  const CarSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Scaffold(
          backgroundColor: Colors.greenAccent,
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text('Select your car'),
            ),
          ),
        ),
      ),
    );
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Text('Choose your location'),
        ),
      ),
    );
  }
}

class StationSelectionPage extends StatelessWidget {
  const StationSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Center(
          child: Text('Select a station'),
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Text('Choose your services'),
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Text('Make a payment'),
        ),
      ),
    );
  }
}
