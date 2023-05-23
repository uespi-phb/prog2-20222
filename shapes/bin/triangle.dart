import 'dart:math';
import './shape.dart';
import './point.dart';

class Triangle extends Shape {
  final double edge;

  Triangle(this.edge, {Point? center})
      : super(
          name: 'Triangle',
          center: center,
        );

  @override
  void show() {
    super.show();
    print('edge  : $edge');
  }

  @override
  double area() => edge * edge * sqrt(3.0) / 4.0;
  @override
  double perimeter() => 3 * edge;
}

Triangle t = Triangle(10.0);
