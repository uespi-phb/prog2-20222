import 'dart:math';

import './shape.dart';
import './point.dart';

class Elipsis extends Shape {
  final double a;
  final double b;

  Elipsis({
    required this.a,
    required this.b,
    Point? center,
    String name = 'Elipsis',
  }) : super(
          name: name,
          center: center,
        );

  @override
  double area() => pi * a * b;

  @override
  double perimeter() {
    if (a == 0.0) {
      return 0.0;
    }
    double e = sqrt(a * a - b * b) / a;

    return pi *
        a *
        (2 -
            pow(e, 2.0) / 2 -
            (3.0 * pow(e, 4.0)) / 32 -
            (5 * pow(e, 6)) / 128);
  }
}
