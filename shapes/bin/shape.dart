import 'point.dart';

class Shape {
  final String name;
  final Point coord;

  Shape({
    required this.name,
    required this.coord,
  });

  @override
  String toString() => 'Shape()';

  void show() {
    print('$name:');
    print('center: (${coord.x},${coord.y})');
  }
}
