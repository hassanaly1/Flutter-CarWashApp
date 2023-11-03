class CarWashService {
  final String name;
  final double price;

  CarWashService({required this.name, required this.price});
}

class SelectableCarWashService {
  final CarWashService service;
  bool isSelected;

  SelectableCarWashService({required this.service, this.isSelected = false});
}
