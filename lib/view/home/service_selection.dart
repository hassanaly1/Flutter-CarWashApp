import 'package:flutter/material.dart';
import 'package:flutter_carwash/model/carwash_service_model.dart';
import 'package:flutter_carwash/utilities/constants.dart';
import 'package:flutter_carwash/view/home/components/custom_service_widget.dart';
import 'package:flutter_carwash/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

class ServicesSelectionScreen extends StatefulWidget {
  const ServicesSelectionScreen({super.key});

  @override
  State<ServicesSelectionScreen> createState() =>
      _ServicesSelectionScreenState();
}

class SelectableCarWashService {
  final CarWashService service;
  bool isSelected;

  SelectableCarWashService({required this.service, this.isSelected = false});
}

class _ServicesSelectionScreenState extends State<ServicesSelectionScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  List<CarWashService> carWashServices = [
    // Your list of car wash services
    CarWashService(name: 'Basic Wash', price: 14.99),
    CarWashService(name: 'Premium Wash', price: 19.99),
    CarWashService(name: 'Interior Cleaning', price: 2.99),
    CarWashService(name: 'Hand Wash', price: 12.99),
    CarWashService(name: 'Polishing and Waxing', price: 29.99),
    CarWashService(name: 'Detailing', price: 49.99),
    CarWashService(name: 'Wheel and Rim Cleaning', price: 9.99),
    CarWashService(name: 'Bug and Tar Removal', price: 7.99),
    CarWashService(name: 'Undercarriage Wash', price: 8.99),
    CarWashService(name: 'Engine Bay Cleaning', price: 15.99),
    CarWashService(name: 'Odor Removal', price: 14.99),
    CarWashService(name: 'Convertible Top Cleaning', price: 19.99),
    CarWashService(name: 'Headlight Restoration', price: 9.99),
    CarWashService(name: 'Mat Shampooing', price: 6.99),
    CarWashService(name: 'Scratch and Paint Chip Repair', price: 18.99),
    CarWashService(name: 'Rust Proofing', price: 22.99),
    // Add more services here
  ];

  late List<SelectableCarWashService> selectableServices;
  int selectedContainerIndex = -1;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    selectableServices = carWashServices
        .map((service) => SelectableCarWashService(service: service))
        .toList();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  void selectContainer(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TabBar(
                  padding: const EdgeInsets.all(7),
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  labelStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300),
                  labelColor: AppAssets.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      text: 'Primary',
                      height: 40,
                    ),
                    Tab(
                      text: 'Additional',
                      height: 40,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        CustomServiceWidget(
                          serviceName: 'Basic Wash',
                          servicePrice: 14.99,
                          isSelected: selectedContainerIndex == 0,
                          onTap: () {
                            selectContainer(0);
                          },
                        ),
                        CustomServiceWidget(
                          serviceName: 'Premium Wash',
                          servicePrice: 19.99,
                          isSelected: selectedContainerIndex == 1,
                          onTap: () {
                            selectContainer(1);
                          },
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: selectableServices.length,
                            itemBuilder: (context, index) {
                              SelectableCarWashService selectableService =
                                  selectableServices[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectableService.isSelected =
                                        !selectableService.isSelected;
                                  });
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    height: context.height * 0.07,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                            color: Colors.grey.shade300)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          text: selectableService.service.name,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Row(
                                          children: [
                                            CustomTextWidget(
                                              text:
                                                  '\$${selectableService.service.price.toStringAsFixed(2)}',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700,
                                              textColor: Colors.orangeAccent,
                                            ),
                                            const SizedBox(width: 5.0),
                                            Checkbox(
                                              value:
                                                  selectableService.isSelected,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectableService.isSelected =
                                                      value!;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
