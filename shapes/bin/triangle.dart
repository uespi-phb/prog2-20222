import 'dart:math';
import './shape.dart';
import './point.dart';

class Triangle extends Shape {
  final double edge;

  Triangle(this.edge)
      : super(
          name: 'Triangle',
          coord: Point(),
        );

  Triangle.fromPoint(this.edge, Point center)
      : super(
          name: 'Triangle',
          coord: center,
        );

  double area() => edge * edge * sqrt(3.0) / 4.0;
  double perimeter() => 3 * edge;
}
