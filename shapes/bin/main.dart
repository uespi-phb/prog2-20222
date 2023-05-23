import 'dart:math';

import './point.dart';
import './shape.dart';
import './circle.dart';
import './rect.dart';
import './square.dart';
import './triangle.dart';

void main() {
  const shapeCount = 10;

  for (var k = 0; k < shapeCount; k++) {
    final Shape shape = shapeRandom();

    print(shape.name);
    print('perimeter: ${shape.perimeter()}');
    print('area     : ${shape.area()}');
    print('----------------------');
  }
}

Shape shapeRandom() {
  final rnd = Random();
  Shape shape;
  Point center;
  int shapeIndex;

  shapeIndex = rnd.nextInt(Shapes.values.length);
  center = Point(
    10.0 - rnd.nextInt(20),
    10.0 - rnd.nextInt(20),
  );

  switch (Shapes.values[shapeIndex]) {
    case Shapes.circle:
      shape = Circle(
        rnd.nextInt(20).toDouble(),
        center: center,
      );
      break;
    case Shapes.triangle:
      shape = Triangle(
        rnd.nextInt(20).toDouble(),
        center: center,
      );
      break;
    case Shapes.rect:
      shape = Rect(
        height: rnd.nextInt(20).toDouble(),
        width: rnd.nextInt(20).toDouble(),
        center: center,
      );
      break;
    case Shapes.square:
      shape = Square(
        rnd.nextInt(20).toDouble(),
        center: center,
      );
      break;
  }
  return shape;
}

/*
void main() {
  Circle c1 = Circle(5.0);
  Circle c2 = Circle(3.0, center: Point(10.0, 7.0));
  Circle c3 = Circle(3.0, center: Point(3.0, 5.0));
  Triangle t1 = Triangle(8.0);
  Triangle t2 = Triangle(8.0, center: Point(-5.0, 5.0));
  Rect r1 = Rect(width: 5.0, height: 8.0);
  Rect r2 = Rect(width: 5.0, height: 8.0, center: Point(-4.0, 8.0));
  Square s1 = Square(8.0);
  Square s2 = Square(8.0, center: Point(1.0, 7.0));

  c1.show();
  c2.show();
  c3.show();
  t1.show();
  t2.show();
  r1.show();
  s1.show();
  s2.show();
}
*/
