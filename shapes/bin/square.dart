import './rect.dart';
import './point.dart';

class Square extends Rect {
  Square(double edge)
      : super(
          name: 'Square',
          height: edge,
          width: edge,
        );

  Square.fromPoint(double edge, Point center)
      : super.fromPoint(
          name: 'Square',
          height: edge,
          width: edge,
          center: center,
        );
}
