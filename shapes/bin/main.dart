import './circle.dart';
import './triangle.dart';
import './rect.dart';
import './square.dart';
import './point.dart';

void main() {
  Circle c1 = Circle(5.0);
  Circle c2 = Circle.fromPoint(3.0, Point(10.0, 7.0));
  Circle c3 = Circle.fromXY(3.0, 3.0, 5.0);
  Triangle t1 = Triangle(8.0);
  Triangle t2 = Triangle.fromPoint(8.0, Point(-5.0, 5.0));
  Rect r1 = Rect(width: 5.0, height: 8.0);
  Rect r2 = Rect.fromPoint(width: 5.0, height: 8.0, center: Point(-4.0, 8.0));
  Square s1 = Square(8.0);
  Square s2 = Square.fromPoint(8.0, Point(1.0, 7.0));

  c1.show();
  c2.show();
  c3.show();
  t1.show();
  t2.show();
  r1.show();
  s1.show();
  s2.show();
}
