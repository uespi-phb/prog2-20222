import 'dart:math';

import './point.dart';
import './shape.dart';

class Circle extends Shape {
  double radius;

  Circle(this.radius)
      : super(
          name: 'Circle',
          coord: Point(),
        );

  @override
  String toString() => 'Circle($radius)';

  double area() => pi * radius * radius;
  double perimeter() => 2 * pi * radius;
}
