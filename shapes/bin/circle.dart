import 'dart:math';

import './point.dart';
import './shape.dart';

class Circle extends Shape {
  final double radius;

  Circle(this.radius)
      : super(
          name: 'Circle',
          coord: Point(),
        );

  Circle.fromPoint(
    this.radius,
    Point center,
  ) : super(
          name: 'Circle',
          coord: center,
        );

  Circle.fromXY(
    this.radius,
    double x,
    double y,
  ) : super(
          name: 'Circle',
          coord: Point(x, y),
        );

  @override
  String toString() => 'Circle($radius)';

  @override
  void show() {
    super.show();
    print('radius: $radius');
  }

  double area() => pi * radius * radius;
  double perimeter() => 2 * pi * radius;
}
