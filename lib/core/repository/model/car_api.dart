class CarApi {
  final int id;
  final String make;
  final String model;
  final int price;

  CarApi(
      {required this.id,
      required this.make,
      required this.model,
      required this.price});

  factory CarApi.fromJson(Map<String, dynamic> json) {
    return CarApi(
      id: json['id'],
      make: json['make'],
      model: json['model'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'price': price,
    };
  }
}
