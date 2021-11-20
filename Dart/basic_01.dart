// import 'Basic_04.dart';
// import 'Basic_05.dart';

// void main() async {
//   // print("Hello, World");
//   await getVersionName().then((value) => {print(value)});
//   print('end process');
// }

// Future<String> getVersionName() async {
//   var versionName = await lookUpVersionName();
//   return versionName;
// }

// String lookUpVersionName() {
//   return 'Android Q';
// }

//==============================
//==============================
//==============================
// import 'dart:async';

// Future<int> sumStream(Stream<int> stream) async {
//   var sum = 0;
//   await for (var value in stream) {
//     print('sumStream : $value');
//     sum += value;
//   }
//   return sum;
// }

// Stream<int> countStream(int to) async* {
//   for (int i = 1; i <= to; i++) {
//     print('countStream: $i');
//     yield i;
//   }
// }

// void main() async {
//   var stream = countStream(10);
//   var sum = await sumStream(stream);
//   print('sum : $sum');
// }

//==============================
//==============================
//==============================

void main() {
  Car bmw = new Car(320, 100000, 'BMW');
  Car benz = new Car(250, 70000, 'BENZ');
  Car ford = new Car(200, 80000, 'FORD');

  // bmw.slaeCar();
  // print(bmw.price);
  // bmw.slaeCar();
  // print(bmw.price);
  // bmw.slaeCar();
  // print(bmw.price);

  num threeBargin = bmw.price;
  for (var i = 0; i < 3; i++) {
    threeBargin = bmw.slaeCar();
    print(threeBargin);
  }
  // print(threeBargin);
}

class Car {
  late int maxSpeed;
  late num price;
  late String name;

// Constructor
  Car(int maxSpeed, num price, String carName) {
    this.maxSpeed = maxSpeed;
    this.price = price;
    this.name = carName;
  }

  num slaeCar() {
    price = price * 0.9;

    return price;
  }
}
