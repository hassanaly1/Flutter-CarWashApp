class CarModel {
  final String carImage;
  bool isSelected;
  final String carName;

  CarModel({
    required this.carImage,
    this.isSelected = false,
    required this.carName,
  });
}
