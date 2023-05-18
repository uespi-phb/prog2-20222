import './point.dart';
import './shape.dart';

class Rect extends Shape {
  final double height;
  final double width;

  Rect({
    String name = 'Rect',
    required this.height,
    required this.width,
  }) : super(
          name: name,
          coord: Point(),
        );

  Rect.fromPoint({
    String name = 'Rect',
    required this.height,
    required this.width,
    required Point center,
  }) : super(
          name: name,
          coord: center,
        );

  double area() => height * width;
  double perimeter() => 2 * (height + width);
}
