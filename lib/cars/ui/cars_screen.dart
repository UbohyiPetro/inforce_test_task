import 'package:flutter/material.dart';
import 'package:inforce_test_task/cars/ui/car_item.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          elevation: 0,
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (BuildContext context, int index) {
                    var car = cars[index];
                    return CarItem(car: car);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Hardcode list of cars
List<Car> cars = [
  Car(make: "BMW"),
  Car(make: "Mercedes"),
  Car(make: "Toyota"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
  Car(make: "Audi"),
];

class Car {
  final String make;

  Car({required this.make});
}
