class CarApi {
  final int id;
  final String make;

  CarApi({required this.id, required this.make});

  factory CarApi.fromJson(Map<String, dynamic> json) {
    return CarApi(
      id: json['id'],
      make: json['make'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make,
    };
  }

}
