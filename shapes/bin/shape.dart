import 'point.dart';

enum Shapes {
  circle,
  triangle,
  rect,
  square,
}

abstract class Shape {
  final String name;
  final Point center;

  Shape({
    required this.name,
    Point? center,
  }) : center = center ?? Point();

  @override
  String toString() => 'Shape()';

  void show() {
    print('$name:');
    print('center: (${center.x},${center.y})');
  }

  double area();
  double perimeter();
}
