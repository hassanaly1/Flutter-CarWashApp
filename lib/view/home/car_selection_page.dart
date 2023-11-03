import 'package:flutter/material.dart';
import 'package:flutter_carwash/model/car_model.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

class CarSelectionPage extends StatefulWidget {
  const CarSelectionPage({super.key});

  @override
  State<CarSelectionPage> createState() => _CarSelectionPageState();
}

class _CarSelectionPageState extends State<CarSelectionPage> {
  List<CarModel> carList = [
    CarModel(
      carImage: 'assets/images/car1.png',
      isSelected: true,
      carName: 'Micro',
    ),
    CarModel(
      carImage: 'assets/images/car2.png',
      isSelected: false,
      carName: 'Sedan',
    ),
    CarModel(
      carImage: 'assets/images/car3.png',
      isSelected: false,
      carName: 'SUV',
    ),
    CarModel(
      carImage: 'assets/images/car4.png',
      isSelected: false,
      carName: 'Compact',
    ),
    CarModel(
      carImage: 'assets/images/car5.png',
      isSelected: false,
      carName: 'Sports',
    ),
    CarModel(
      carImage: 'assets/images/car6.png',
      isSelected: false,
      carName: 'Electric',
    ),
    CarModel(
      carImage: 'assets/images/car7.png',
      isSelected: false,
      carName: 'Convertible',
    ),
    CarModel(
      carImage: 'assets/images/car8.png',
      isSelected: false,
      carName: 'Luxury',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text:
                            'Select your car type so we can adjust our prices for you.',
                        maxLines: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomTextWidget(
                        text: 'Car type',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 15),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: carList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              height: context.height * 0.08,
                              color: AppAssets.textLightColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    text: carList[index].carName,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(carList[index].carImage),
                                      const SizedBox(width: 30.0),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            carList[index].isSelected =
                                                !carList[index].isSelected;
                                          });
                                        },
                                        icon: Icon(
                                          carList[index].isSelected
                                              ? Icons.radio_button_checked
                                              : Icons.radio_button_off,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
