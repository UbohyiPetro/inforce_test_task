class CarApi {
  final String make;
  CarApi({required this.make});

  factory CarApi.fromJson(Map<String, dynamic> json) {
    return CarApi(
      make: json['make'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'make': make,
    };
  }

}
